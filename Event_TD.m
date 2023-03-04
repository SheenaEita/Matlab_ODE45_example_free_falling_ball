%% Event of touch down
% positon = 0 (y(1) = 0)
% when touch down, stop solving ODE (isterminal = 1)
% falling (direction = -1)
% 2022/07/07 Y.T. Huang

function [value,isterminal,direction] = event_TD(t,y)
value = y(1);
isterminal = 1;
direction = -1;
end

