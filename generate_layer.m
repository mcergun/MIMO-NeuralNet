function layer = generate_layer(post, count)
    layer.count = count;
    layer.weights = rand(post.count, count);
    layer.weight_deltas = zeros(count, 1);
    layer.values = zeros(count, 1);
    layer.deltas = zeros(1, count); % this is in row order for easier calc
    layer.bias = -0.5;
end