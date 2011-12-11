%% Initialization
clear all; close all; clc

v = 10;
t_step = 4;
omega = (pi/2);

state = zeros(3,5);

for i=2:5
	state(1, i) = state(1, i-1) + v * t_step * cos(state(3,i-1));
	state(2, i) = state(2, i-1) + v * t_step * sin(state(3,i-1));
	state(3, i) = state(3, i-1) + omega * t_step;
end