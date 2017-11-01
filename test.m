% This script defines the structures used in this implementation
% They are here only to serve as an example

clear
clc
close all

% increase printing precision
format long

% An example neural network
% 2 input neurons, 
% 6 hidden neurons on the first layer, 4 hidden neurons on the second layer
% 2 output neurons

output_layer.count = 2;
output_layer.desired = zeros(output_layer.count, 2);
hidden_layer = generate_layer(output_layer, 4);
input_layer = generate_layer(hidden_layer, 2);
learning_rate = 0.5;

input_set = [0 0; 0 1; 1 0; 1 1];
desired_set = [0 0; 1 0; 1 0; 0 1]; 

epoch_size = 4;

epochs = 100000;
errors = zeros(epochs, 1);

tic;
for i=1:epochs
    local_errors = zeros(epoch_size, 1);
    for j=1:epoch_size
        input_layer.values = input_set(j, :)';
        output_layer.desired = desired_set(j, :)';
        hidden_layer = propagate_forward(input_layer, hidden_layer);
        output_layer = propagate_forward(hidden_layer, output_layer);

        output_layer = propagate_backward(output_layer);
        hidden_layer = propagate_backward(hidden_layer, output_layer);
        input_layer = propagate_backward(input_layer, hidden_layer);

        input_layer = apply_new_weights(input_layer, learning_rate);
        hidden_layer = apply_new_weights(hidden_layer, learning_rate);
        local_errors(j) = sum(abs(output_layer.desired - output_layer.values));
    end
    errors(i) = mean(local_errors);
end
toc;

input_layer.values = input_set(1, :)';
hidden_layer = propagate_forward(input_layer, hidden_layer);
output_layer = propagate_forward(hidden_layer, output_layer);
output_layer.values

input_layer.values = input_set(2, :)';
hidden_layer = propagate_forward(input_layer, hidden_layer);
output_layer = propagate_forward(hidden_layer, output_layer);
output_layer.values

input_layer.values = input_set(3, :)';
hidden_layer = propagate_forward(input_layer, hidden_layer);
output_layer = propagate_forward(hidden_layer, output_layer);
output_layer.values

input_layer.values = input_set(4, :)';
hidden_layer = propagate_forward(input_layer, hidden_layer);
output_layer = propagate_forward(hidden_layer, output_layer);
output_layer.values

plot(errors);
% hidden_layer.weight_deltas
% input_layer.weight_deltas
