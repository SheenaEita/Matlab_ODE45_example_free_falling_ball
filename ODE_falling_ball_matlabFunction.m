function out1 = ODE_falling_ball_matlabFunction(t,in2)
%ODE_falling_ball_matlabFunction
%    OUT1 = ODE_falling_ball_matlabFunction(T,IN2)

%    This function was generated by the Symbolic Math Toolbox version 9.0.
%    25-Jul-2022 17:13:07

y2 = in2(2,:);
out1 = [y2;-9.81e+2./1.0e+2];
