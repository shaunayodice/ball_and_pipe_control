%% LSim for ball and pipe
%
%
% Created By: Shauna Yodice
%
%
% Modified on: 4/15/2022
%
% 
% Purpose: This function is used to implement lsim in MATLAB. We used the
% transfer function and the state space model functions to implement this. 

function simulation = simulation(Q,s)


% assuming the mass of the ball is 0.01 kg
% assuming radius is 0.02 m 

clear;
syms s



g = 9.8; % gravity
v_eq = 2.4384; % Veq 
m_ball = 0.01; % ball mass
p_air = 1.2250; % pho air
v_ball = (4/3) * pi * (0.02^3); % Vol of ball
sample_rate = [0 0.25]; % time step

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
previous_states = []; % create an empty array for the previous runs
pwm = [4000-2727.0447  4000-2727.0447]; % I should not have values here, 
% but I am not sure how to take the values from the agent and populate them in here. 
% The array should have that information inside of it and use it in the simulation. 


Y_vals = zeros(1,runs);
pwm_val = zeros(1,runs);
rewards = zeros(1,runs);


c2 = ((2*g)/ v_eq)*((m_ball-(p_air*v_ball))/m_ball);
c3 = 6.3787 * (10^-4);

N = [c3 * c2];
D = sym2poly(s*(s+c2));

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



Y_vals(i) = Y(j);
new = Y(j);
old = Y_vals(j-1);
current_reward = get_reward(new);
rewards(i) = current_reward;

end

%pwm_val = pwm_val + 2727.0447;

figure(1) 
plot(time,Y_vals)
title('Y')
grid on


figure(2)
plot(time,pwm_val)

