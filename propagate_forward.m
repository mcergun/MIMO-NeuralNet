function output = propagate_forward(current, next)
    next.values = current.weights * current.values;
    output = next;
end