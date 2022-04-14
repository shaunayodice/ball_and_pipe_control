
function Q = q_learning(P_bins, V_bins, F_bins)

%% q_learning function
% created by Shauna Yodice
% Edited on 04/08





% not sure what to set this value to 
num_episodes = 10;

% time limit for system to converge
time_limit = 100;

% variable to check logic is ball has reached desired position
is_done_now = 0;

state_size = perms(length(P_bins), length(V_bins), length(F_bins));


% action size = # of actions - up, down, stay ?
action_size = 3;


%dont think this is right. Need to select a random next Q
Q = rand(state_size,action_size);


    for i = 1:num_episodes
        % select state starting position
    
        S = sample_state();
    
        for j = 1:time_limit

            % possible actions
            actions = find(get_reward(S) ~= 0);

            next_state = actions(randi([1 length(actions)], 1, 1));
    
            % pass through the env
    
            % next_state = set_pwm(device, action);
            is_done_now = is_done();
    
            % check to see if the ball is where we want it to be
            if is_done_now == 1 
            end
            

    
            % call to get reward function
    
            R = get_reward();
    
            % update the value of Q
    
            % a = learning rate - not sure what to make this
            % y = discount factor - not sure what to make this
            a = 0.01;
            y = 0.1;
    
            Q = bellmans(Q, R , S , next_state, a, y);
    
            % update the state to the next state
    
            S = next_state;
    
        end
    end
end




          

