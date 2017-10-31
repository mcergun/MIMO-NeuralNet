function layer = generate_layer(post, count)
    layer.count = count;
    layer.weights = rand(post.count, count);
    layer.weights = layer.weights > 0.5;
    layer.values = zeros(count, 1);
    layer.bias = -0.5;
end