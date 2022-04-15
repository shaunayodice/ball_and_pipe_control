
function Q = q_learning(P_bins, V_bins, F_bins)

%% q_learning function
% created by Shauna Yodice
% Edited on 04/08


% set initial value for R to 0
R = 0;

% not sure what to set this value to 
num_episodes = 10;

% time limit for system to converge
time_limit = 100;

% variable to check logic is ball has reached desired position
is_done_now = 0;

%generate a state list
states=zeros(length(P_bins)*length(V_bins)*length(F_bins),3); % 3 Column matrix of all possible combinations of the discretized state.
index=1;
for j=1:length(P_bins)
    for k = 1:length(V_bins)
        for l = 1:length(F_bins)
        states(index,1) = P_bins(j);
        states(index,2) = V_bins(k);
        states(index,3) = F_bins(l);
        index=index+1;
        end
    end
end

state_size = perms(length(P_bins), length(V_bins), length(F_bins));


% action size = # of actions - up, down, stay ?
action_size = 3;


%dont think this is right. Need to select a random next Q
%Q = rand(state_size,action_size);

Q = repmat(R,[length(P_bins) * length(V_bins)*length(F_bins)*action size]);



% Start the learning !
    for episodes = 1:num_episodes
        % select state starting position
    
        S = Sample_state(P_bins,V_bins,F_bins);
    
        for j = 1:time_limit

            % possible actions
            % actions = find(get_reward(S) ~= 0);

            actions = get_action(episodes, num_episodes, Q, action_size, P_bins, V_bins, F_bins);

            next_state = actions(randi([1 length(actions)], 1, 1));
    
            % pass through the env
    
            % next_state = set_pwm(device, action);
            is_done_now = is_done();
    
            % check to see if the ball is where we want it to be
            if is_done_now == 1 
            end
            

    
            % call to get reward function
    
            R = get_reward(next_state);
    
            % update the value of Q
    
            % a = learning rate - not sure what to make this
            % y = discount factor - how important is the state and
            % action compared to the future states / actions
            a = 0.01;
            y = 0.1;
    
            Q = bellmans(Q, R , S , next_state, a, y);
    
            % update the state to the next state
    
            S = next_state;
    
        end
    end
end




          

