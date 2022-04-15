%% LSim for ball and pipe
%% written by Shauna Yodice
%% Modified on 4/14/2022

%% NEED TO DO SOMETHING WITH THE D - 2700 BUT NOT SURE


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

runs = 5;
time = 1:runs;
explore = 0.9;
previous_states = []; % create an empty array for the previous runs
pwm = [4000-2727.0447  4000-2727.0447]; % I dont know what PWM should have inside of it


Y_vals = zeros(1,runs);
pwm_val = zeros(1,runs);
rewards = zeros(1,runs);


c2 = ((2*g)/ v_eq)*((m_ball-(p_air*v_ball))/m_ball);
c3 = 6.3787 * (10^-4);

N = [c3 * c2];
D = sym2poly(s*(s+c2));

TF = tf(N, D);

state_space = ss(TF);

for i = 1:runs
pwm_val(i) = pwm(1); % need to set the intiial PWM val 
[Y,X,previous_states] = lsim(state_space,pwm, sample_rate, previous_states);
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

figure(1) 
plot(time,Y_vals)
title('Y')
grid on

