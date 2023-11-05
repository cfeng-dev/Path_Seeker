function greedypi = Policy_Improvement(MDP, v, gamma)
%% Description: Policy-Improvement algorithm in MATLAB
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input:    MDP      Markov Decision Process with fields States, Actions, Transition, Reward
%           v        state-value function (v-function)
%           gamma    discount factor (γ)
%
% Output:   greedypi greedy policy based on the provided value function and MDP
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initialization
n = length(MDP.States);   % Number of states in MDP
m = length(MDP.Actions);  % Number of actions in MDP
q = zeros(n, m);          % Initialization of action-value function (q-function)

% %% Compute the action-value function (q-function) for all state-action pairs
% for a = 1:m
%     % Using vectorized operations to calculate q-function(s,a) for all states
%     q(:,a) = sum(MDP.T(:,:,a) .* (MDP.R(:,:,a) + gamma * v'), 2);
% end

%% Compute the action-value function (q-function) for all state-action pairs
for s = 1:n
    for a = 1:m
        prob = MDP.T(s,:,a);                      % Transition probability
        reward = MDP.R(s,:,a);                    % Reward
        s_next = find(MDP.T(s,:,a)~=0);           % Next state
        for j = 1:length(s_next)        
            q(s,a) = q(s,a) + prob(s_next(j)) * (reward(s_next(j)) + gamma*v(s_next(j)));  % Bellman equation for v-function
        end
    end
end

%% Calculate the greedy strategy (π' = argmax_a q(s,a)) based on the action-value function (q-function)
for s=1:n
   greedypihelp = find(q(s,:) == max(q(s,:)));
   greedypi(s) = greedypihelp(1);
end
