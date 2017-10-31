% % This script defines the structures used in this implementation
% % They are here only to serve as an example

clear
clc

% % An example neural network
% % 2 input neurons, 
% % 6 hidden neurons on the first layer, 4 hidden neurons on the second layer
% % 2 output neurons

output_layer.count = 2;
hidden_layers(2) = generate_layer(output_layer, 4);
hidden_layers(1) = generate_layer(hidden_layers(2), 6);
input_layer = generate_layer(hidden_layers(1), 2);

input_layer.values = [1; -1];

hidden_layers(1) = propagate_forward(input_layer, hidden_layers(1));
hidden_layers(2) = propagate_forward(hidden_layers(1), hidden_layers(2));

hidden_layers(1).values
hidden_layers(2).values

input_layer.count = 2;