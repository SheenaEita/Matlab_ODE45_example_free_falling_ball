%% falling ball
% a = -g
% 2022/07/07 Y.T. Huang

function dydt = ODE_falling_ball(t,y)
    g = 9.81;
    dydt = [y(2);-g]; % dy = y(2) , dy/dt = -g
end