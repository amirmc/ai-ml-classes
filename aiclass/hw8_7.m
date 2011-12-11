%% Initialization
clear all; close all; clc

v = 10;
t_step = 4;
omega = (pi/8);

state = zeros(3,5);

for i=2:5
	state(1, i) = state(1, i-1) + v * t_step * cos(  mod(state(3,i-1), 2*pi) );
	state(2, i) = state(2, i-1) + v * t_step * sin(  mod(state(3,i-1), 2*pi) );
	state(3, i) = mod((state(3, i-1) + omega * t_step), 2*pi);
end

%for i=2:5
%	state(1, i) = state(1, i-1) + v * t_step * cos(state(3,i-1));
%	state(2, i) = state(2, i-1) + v * t_step * sin(state(3,i-1));
%	state(3, i) = state(3, i-1) + omega * t_step;
%end

state
