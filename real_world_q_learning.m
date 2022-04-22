% A MATLAB script to control Rowans Systems & Control Floating Ball 
% Apparatus designed by Mario Leone, Karl Dyer and Michelle Frolio. 
% The current control system is a PID controller.
%
% Created by Kyle Naddeo, Mon Jan 3 11:19:49 EST 
% Modified by Shauna Yodice 2/11/22

%% Start fresh
close all; clc; clear device;

%% Connect to device
device = serialport("COM3", 19200);
% s = serialport(3,19200);

%% Parameters
target      = 0.5;   % Desired height of the ball [m]
sample_rate = 0.25;  % Amount of time between controll actions [s] - TIMESTEP used for calculating the velocity



%% Give an initial burst to lift ball and keep in air
% set_pwm(device,0); % Initial burst to pick up ball
% pause(0)
%set_pwm(device, 4000); % Initial burst to pick up ball
%pause(0.99) % Wait 0.1 seconds
%set_pwm(device, 2000); % Set to lesser value to level out somewhere in
% the pipe

%% Initialize variables
% action      = se; % Same value of last set_pwm   
error       = 0;
error_sum   = 0;

%% Feedback loop
while true
    %% Read current height -- replace this section with the lsim
    g = 9.8; % gravity
v_eq = 2.4384; % Veq 
m_ball = 0.01; % ball mass
p_air = 1.2250; % pho air
v_ball = (4/3) * pi * (0.02^3); % Vol of ball
sample_rate = [0 0.25]; % time step

cont_state = binned_state(p, v , f);

S = q_learning(P_bins, V_bins, F_bins);

% variable that will hold the current reward 
current_reward = 0;

% terminal position - where we want the ball to stay
terminal = 0.5;

% number of runs 
runs = 5;
% time frame
time = 1:runs;
% explore rate
explore = 0.9;
%previous_states = []; % create an empty array for the previous runs
%pwm = [4000-2727.0447  4000-2727.0447]; % I should not have values here, 
% but I am not sure how to take the values from the agent and populate them in here. 
% The array should have that information inside of it and use it in the simulation. 


Y_vals = zeros(1,runs);
pwm_val = zeros(1,runs);
rewards = zeros(1,runs);


c2 = ((2*g)/ v_eq)*((m_ball-(p_air*v_ball))/m_ball);
c3 = 6.3787 * (10^-4);

N = [c3 * c2];
D = sym2poly(S*(S+c2));

TF = tf(N, D);

state_space = ss(TF)

a = get_action(Q,S);

actions = [a a];

 [distance, pwm, target, deadpan] = read_data(device);
 y = ir2y(distance);

 x = state_space.C\(y - state_space.D*a);


for i = 1:runs
pwm_val(i) = pwm(1); % need to set the intiial PWM val 
[X,Y,~] = lsim(state_space,sample_rate,actions,x);
previous_states = [previous_states(end-2), previous_states(end)];

    %need to bound Y val to under 1 and above 0
    for j =1:length(sample_rate)

        if Y(j) > 0.90
            Y(j) = 0.90;
        end

        if Y(j) < 0
            Y(j) = 0;
        end
    end

    figure(1) 
    plot(time,X)
    title('Y')
    grid on


    figure(2)
    plot(time,Y)

    
    %% Calculate errors for PID controller
    error_prev = error;             % D
    error      = target - y;        % P
    error_sum  = error + error_sum; % I
    
    %% Control
    prev_action = action;
    %action = % Come up with a scheme no answer is right but do something
    % set_pwm(add_proper_args); % Implement action



    % Q- Learning

    
   

    
    %s = rlNumericSpec([])





%     read_data(device);
%     set_pwm(device, 1000);
%     pause(0.1);
%     set_pwm(device, 3000);
%     read_data(device);
%         
%     % Wait for next sample
%     pause(sample_rate)
end
end

