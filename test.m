% % This script defines the structures used in this implementation
% % They are here only to serve as an example

clear
clc

% % An example neural network
% % 2 input neurons, 
% % 6 hidden neurons on the first layer, 4 hidden neurons on the second layer
% % 2 output neurons

output_layer.count = 2;
output_layer.desired = zeros(output_layer.count, 1);
hidden_layer = generate_layer(output_layer, 2);
input_layer = generate_layer(hidden_layer, 2);

% enter data from https://mattmazur.com/2015/03/17/a-step-by-step-backpropagation-example/
% for validation

input_layer.weights = [0.15 0.20; 0.25 0.30];
input_layer.bias = 0.35;
input_layer.values = [0.05; 0.1];

hidden_layer.weights = [0.40 0.45; 0.50 0.55];
hidden_layer.bias = 0.60;
output_layer.desired = [0.01; 0.99];

hidden_layer = propagate_forward(input_layer, hidden_layer);
output_layer = propagate_forward(hidden_layer, output_layer);

output_layer = propagate_backward(output_layer);
hidden_layer = propagate_backward(hidden_layer, output_layer);
input_layer = propagate_backward(input_layer, hidden_layer);

hidden_layer.weight_deltas
input_layer.weight_deltas
