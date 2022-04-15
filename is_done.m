%% Is done function
%
%
% Purpose: Checks to see if the ball is at the position we want, if it 
% is at the desired position, should return 1. If it does not match the
% desired location, it returns 0
%
%
% Created By: Shauna Yodice
% Modified on: 4/8


function match = is_done()


% need to define the desired location of the ball
desired = 0.5; 

% check to see if the current position of the ball is the desired position

    if desired == ir2y(read_data(device))
        match = 1;
        return
    else
        match = 0;
        return
    end
end




