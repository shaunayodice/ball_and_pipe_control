%% get action function
%% created by Shaun Yodice
%$ Modifed on 4/15
%% either picks the best action or a random action



function [action] = get_action(episodes, num_episodes, Q, actions,p_bins, v_bins,f_bins)


success_rate = 1; % the probability of how often we do what we are supposed to do
eps = 0.5; % initial epsilon
eps_decay = 0.95; % decay factor after iteration

aIdx = index(p_bins,v_bins,f_bins);

if (rand() > eps || episodes == num_episodes) && rand() <= success_rate

    [~,aIdx] = max(Q(sIdx,:));
else
    aIdx = randi(length(actions),1); % random action selected
end

eps = eps*eps_decay;

