%% q_learning function
% created by Shauna Yodice
% Edited on 04/08




function q_learning = q_learning(P_bins, V_bins, F_bins)

% not sure what to set this value to 
num_episodes = 0;

% time limit for system to converge
time_limit = 100;

% variable to check logic is ball has reached desired position
is_done_now = 0;

state_size = perms(length(P_bins), length(V_bins), length(F_bins));


% action size = # of actions
action_size = 0;


%dont think this is right. Need to select a random next Q
Q = randperm(state_size,action_size);


    for i = 1:num_episodes
        % select state
    
        S = sample_state();
    
        for j = 1:time_limit
            action = get_action(S, Q);
    
            % pass through the env
    
            S' = set_pwm(device, action);
            is_done_now = is_done();
    
            % check to see if the ball is where we want it to be
            if is_done_now == 1 end
    
            % call to get reward function
    
            R = get_reward();
    
            % update the value of Q
    
            % a = learning rate - not sure what to make this
            % y = discount factor - not sure what to make this
            a = 00;
            y = 0.1;
    
            Q = bellman_eq(Q, R , S , S', a, y);
    
            % update the state to the next state
    
            S = S';
    
        end
    end
end




          

