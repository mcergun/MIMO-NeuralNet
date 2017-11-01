function output = propagate_forward(current, next)
    next.values = sigmf(current.weights * current.values + current.bias, [1 0]);
    output = next;
end