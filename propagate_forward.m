function output = propagate_forward(current, next)
    next.values = sigmf(current.weights * current.values, [1 0]) + next.bias;
    output = next;
end