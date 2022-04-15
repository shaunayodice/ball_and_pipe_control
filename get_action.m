%% Get Action Function
%
%
% Purpose: This function either picks the best action based off the current
% or it selects a random action and returns the action selected 
%
%
% Created By: Shauna Yodice
%
%
%$ Modifed on 4/15




function [action] = get_action(episodes, num_episodes, Q, actions,p_bins, v_bins,f_bins)


success_rate = 1; % the probability of how often we do what we are supposed to do
eps = 0.5; % initial epsilon
eps_decay = 0.95; % decay factor after iteration

aIdx = index(p_bins,v_bins,f_bins); % actions index

% Here is where it picks the action. Checks the best action against the Q-
% table which is exploitation or it picks a random action which is
% exploration

if (rand() > eps || episodes == num_episodes) && rand() <= success_rate

    [~,aIdx] = max(Q(sIdx,:));
else
    aIdx = randi(length(actions),1); % random action selected
end

% update the epsilon value after the action is selected
eps = eps*eps_decay;

