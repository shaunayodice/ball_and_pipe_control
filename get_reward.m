

function get_reward[reward] = get_reward(S')

% set the end point desired
terminal = 00;

% reward variable
reward = 0;


    if S' ~= terminal
        reward = -1;
        return
    else
        reward = 1;
        return
    end
end
