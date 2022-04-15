%% reward function
%% created by Shauna
%% checks the state against the desired state and returns either 1 or -1
%% modified on 4/11

function reward = get_reward(next_state)

% set the end point desired
terminal = 0.5;

    if next_state ~= terminal
        reward = -1;
        return
    else
        reward = 1;
        return
    end
end
