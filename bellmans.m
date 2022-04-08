function Q = bellmans(Q, r, s, next_state, a, y)
% Generation of the Bellman's Equation
% Q : Output
% r : Reward
% s : Current State
% next_state : Next State
% a : Learning Rate
% y = Discount Factor

Q(idx0,:) = Q(idx0,:) + a*(r + y*max(Q(idx,:)) - Q(idx0,:));
s = next_state;
end