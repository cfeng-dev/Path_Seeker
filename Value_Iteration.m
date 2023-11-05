function [v, pi] = Value_Iteration(MDP, gamma)
%% Description: Value-Interation algorithm in MATLAB
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input:    MDP      Markov decision process
%           gamma    discount factor (γ)
%
% Output:   v        state-value function (v-function)
%           pi       optimal strategy
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Number of states
n = length(MDP.States);

%% Initialize state-value function (v-function) and strategy
v = zeros(1, n);
pi = zeros(1, n);

%% Loop until convergence
delta = inf; % Initialize delta for convergence check
while delta > 0.001
    delta = 0;
    for s = 1:n
        v_old = v(s);
        q_sa = sum(MDP.T(s,:,:) .* (MDP.R(s,:,:) + gamma * v), 2); % Vectorized action-value function (q-function)
        [v(s), pi(s)] = max(q_sa); % Update the value function and policy simultaneously
        delta = max(delta, abs(v_old - v(s))); % Update delta for convergence check
    end
end
end
