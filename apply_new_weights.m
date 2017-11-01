function output = apply_new_weights(layer, learning_rate)
    layer.weights = layer.weights - learning_rate * layer.weight_deltas;
    
    output = layer;
end