%% generate ODE of falling ball by matlabFunction
% When the system becomes more complex, creating the state space equations
% by matlabFunction will be an easier way, compare with writing it by hands.
% This file show how to generate an ".m" file by matlabFunction to replace 
% "ODE_falling_ball" and "event_TD".
% 2022/07/07 Y.T. Huang

clc;
clear;

m = 1;
g = 9.81;
h = 10;
save('param.mat', 'm', 'g', 'h');

%% system coordinates
y = sym('y', [2, 1], 'real'); % y = [position; velocity]
q = y(1); q_dot = y(2); % POLA generalized coordinate

L = m*(q_dot'*q_dot)/2 - (m*g*q); % Lagrangian = T - V
E_L_eqn = [q_dot; jacobian(L, q)' - jacobian(jacobian(L, q_dot), q)*q_dot]; % Eular-Lagrange equation

%% generate ODE and event function by matlabFunction
syms t real
matlabFunction(simplify(E_L_eqn), 'file', 'ODE_falling_ball_matlabFunction', 'vars', {t, y});
matlabFunction(y(1), 1, -1, 'file', 'Event_TD_matlabFunction', ...
    'vars', {t, y}, 'outputs', {'value', 'isterminal', 'direction'});
