function output = propagate_backward(current, next)
    
    if ~exist('next','var')
% % no next layer is available, this must be an output layer
        current.deltas = ((current.values - current.desired) .* ...
            (1 - current.values) .* current.values)';
    else
% % there is a next layer available, this must be a hidden layer
        current.deltas = (next.deltas * current.weights) .* ...
            (current.values .* (1 - current.values))';
    end
    output = current;
end