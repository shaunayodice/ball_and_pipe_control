

function reward = get_reward(next_state)

% set the end point desired
terminal = 00;



    if next_state ~= terminal
        reward = -1;
        return
    else
        reward = 1;
        return
    end
end
