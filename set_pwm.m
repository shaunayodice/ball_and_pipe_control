function action = set_pwm(device, pwm_value)
%% Sets the PWM of the fan
% Inputs:
%  ~ device: serialport object controlling the real world system
%  ~ pwm_value: A value from 0 to 4095 to set the pulse width modulation of
%  the actuator
% Outputs:
%  ~ action: the control action to change the PWM
%
% Created by:  Kyle Naddeo 2/4/2022
% Modified by: YOUR NAME and DATE



%% Force PWM value to be valid
% pwm_value = % Bound value to limits 0 to 4095

LB = 0;
UB = 4095;

if pwm_value > UB
    pwm_value = UB;
elseif pwm_value < LB
    pwm_value = LB;
end

%% Send Command
action = sprintf('%04.f', pwm_value);
action = ['P', action]
% use the serialport() command options to change the PWM value to action

write(device,action, "string");

end
