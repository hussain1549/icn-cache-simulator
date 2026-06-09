% =========================================================================
% FILE: IcnCacheEngine.m
% DESCRIPTION: Handles ICN Content Store lookups and evictions (LRU/LFU/FIFO/Random).
% =========================================================================
classdef IcnCacheEngine < handle
    properties
        Capacity
        Algorithm
        Store        % Array containing unique content keys currently cached
        Counter      % Dynamic structural arrays used to track time/frequency
        Age
    end
    
    methods
        function obj = IcnCacheEngine(capacity, algorithm)
            obj.Capacity = capacity;
            obj.Algorithm = algorithm;
            obj.Store = [];
            obj.Counter = []; % Tracks access frequencies for LFU
            obj.Age = [];     % Tracks execution tick indices for LRU / FIFO
        end
        
        function hit = check_and_update(obj, content_id)
            % Check if item exists inside our ICN Content Store (CS)
            idx = find(obj.Store == content_id, 1);
            
            if ~isempty(idx)
                %% --- CACHE HIT CASE ---
                hit = true;
                if strcmp(obj.Algorithm, 'LRU')
                    % Update age marker to reflect most recent access
                    obj.Age(idx) = max(obj.Age) + 1;
                elseif strcmp(obj.Algorithm, 'LFU')
                    % Increment frequency access metric
                    obj.Counter(idx) = obj.Counter(idx) + 1;
                end
            else
                %% --- CACHE MISS CASE ---
                hit = false;
                if length(obj.Store) < obj.Capacity
                    % Space available: Append directly into Content Store
                    obj.Store(end+1) = content_id;
                    if strcmp(obj.Algorithm, 'LFU')
                        obj.Counter(end+1) = 1;
                    end
                    obj.Age(end+1) = idx_safe_max(obj.Age) + 1;
                else
                    % Cache Full: Evict item matching algorithmic parameters
                    evict_idx = obj.get_eviction_index();
                    
                    % Insert new item into the slot of the evicted element
                    obj.Store(evict_idx) = content_id;
                    if strcmp(obj.Algorithm, 'LFU')
                        obj.Counter(evict_idx) = 1;
                    end
                    obj.Age(evict_idx) = idx_safe_max(obj.Age) + 1;
                end
            end
        end
        
        function evict_idx = get_eviction_index(obj)
            switch obj.Algorithm
                case 'LRU'
                    % Evict item with the lowest historical age marker
                    [~, evict_idx] = min(obj.Age);
                case 'LFU'
                    % Evict item accessed the fewest absolute times
                    [~, evict_idx] = min(obj.Counter);
                case 'FIFO'
                    % Evict item item that entered first (lowest index age pointer)
                    [~, evict_idx] = min(obj.Age);
                case 'Random'
                    % Pure randomized selection
                    evict_idx = randi(obj.Capacity);
                otherwise
                    error('Unknown algorithm type configured.');
            end
        end
    end
end

function m = idx_safe_max(arr)
    if isempty(arr)
        m = 0;
    else
        m = max(arr);
    end
end
