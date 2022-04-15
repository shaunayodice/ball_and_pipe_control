% % % binnedstate = cont_state

p = 1 % calculated value
v = 1 % calculated value
f = 1 % calculated value

% read
p,v,f = read_pwm

cont_state = [p;v;f] % matrix

% state = [p,v,f] %% position, velocity, fan speed
% assign matrices 

max_p = 0.95;
min_p = 0;

%max_v = dont know

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

%'
% takes result from matrix
binned_p = P_bins(pmin)
binned_v = V_bins(vmin)
binned_f = F_bins(fmin)

% stores binned_p, binned_v and binned_f in 1 cell array
u={binned_p,binned_v,binned_f}

% concatenates min of all variables 
binned_state = cat(1,u{:})

%% example of concat 
% a=[1 2 3]
% b=[4 5 6]
% c=[7 8 9]
% u={a,b,c}
% ans = cat(1,u{:})
