%% Bins for all variables needed to store and change values 
%% Written by Matthew Buchinski
%% Modified on 4/15/2022

% [p,v,f] %% where p = position, v = velocity, and f=fan speed
p = 1 % calculated value
v = 1 % calculated value
f = 1 % calculated value

% read
p,v,f = read_pwm

cont_state = [p;v;f] % matrix

% assign matrices 
max_p = 0.95;
min_p = 0;
max_v = 50; % need to update

P_bins = min_p:max_p/20:max_p % change values
V_bins = 0:.1:.91 % change values
F_bins = 0:.1:.91 % change values

% define bin states
bin_states = (cont_state(P_bins,V_bins,F_bins))

% pull individual states for each value from bin_states
p_cont = cont_state(1)
v_cont = cont_state(2)
f_cont = cont_state(3)

% takes the argmin(indexes) of matrices for p,v,and f
[~,pmin]=min((abs(P_bins - p_cont)))
[~,vmin]=min((abs(V_bins - f_cont)))
[~,fmin]=min((abs(F_bins - v_cont)))

% takes result from matrix
binned_p = P_bins(pmin)
binned_v = V_bins(vmin)
binned_f = F_bins(fmin)

% stores binned_p, binned_v and binned_f in 1 cell array
u={binned_p,binned_v,binned_f}

% concatenates min of all variables 
binned_state = cat(1,u{:})


