%% ODE45 praction / example : freely falling ball
% A ball falls from a height of "h" meters. Use ode45 to solve the position
% and velocity of the ball. Compare the numerical solution with analytic
% solution.
% 2022/07/07 Y.T. Huang
clc;
clear;
load param.mat

%% Set up
tspan = [0 5];
initial_condition = [h; 0]; %[ position; velocity ]
reltol = 10^(-7);   abstol = 10^(-7);

% option
%odeoption = odeset('event', @Event_TD, ...
        %'reltol', reltol, 'abstol', abstol);
odeoption = odeset( 'event', @Event_TD_matlabFunction, ...
        'reltol', reltol, 'abstol', abstol );

%% solve ODE by ode45
% [t,y] = ode45( @ODE_falling_ball, tspan,initial_condition, odeoption );
[t,y] = ode45( @ODE_falling_ball_matlabFunction, tspan, initial_condition, odeoption );

%% Figure
plot(t,y(:,1), '-o' , t, y(:,2), '-o' )
title( 'Solution of falling ball with ODE45' );
xlabel( 'Time t (s)' );
ylabel( 'Solution y (m)' );
legend( 'ball position', 'ball velocity' );

hold on;

%% Analutic solution
y = initial_condition(1)-0.5*g*t.*t;
plot(t, y);
legend( 'ball position', 'ball velocity', 'position analytic solution' );
