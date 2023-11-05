function v = Policy_Evaluation(MDP,pi,gamma)
%% Description: Policy-Evaluation algorithm in MATLAB
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input:    MDP      Markov decision process
%           pi       strategy
%           gamma    discount factor
%
% Output:   v        state-value function (v-function)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Parameters and initialization
theta = 1e-10;              % Stopping-parameter of algorithm
flag = 0;                   % Stopping-flag of algorithm
n = length(MDP.States);     % Number of states of MDP
v_previous = zeros(1,n);    % Initialization of state-value function for k=0

%% Loop until convergence
while flag ~= 1
    v = zeros(1,n);   % Initialization of v-function for the actual step
    for s= 1:n                                   
        prob = MDP.T(s,:,pi(s));            % Transistion propability
        reward = MDP.R(s,:,pi(s));          % Reward
        s_next = find(MDP.T(s,:,pi(s))~=0); % Next state
        for j = 1:length(s_next)              
        v(s) = v(s) + prob(s_next(j)) * (reward(s_next(j)) + gamma*v_previous(s_next(j))); % Bellman equation for v-function
        end
    end
    if abs(v_previous-v) < theta  % Stopping condition if v-function doesn't change
        flag = 1;
    end
    v_previous = v;               % Copy of v-function for the next step
end

% function v = Policy_Evaluation_One_Iteration(MDP,pi,gamma)
% %% Description: Policy-Evaluation algorithm in MATLAB
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Input:    MDP      Markov decision process
% %           pi       strategy
% %           gamma    discount factor
% %
% % Output:   v        state value function (v-function)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %% Parameters and initialization
% n = length(MDP.States);                % Number of states of MDP
% v_previous = zeros(1,n);               % Initialization of v-function for k=0
% 
% %% Loop for exactly "1" iteration
% for k = 1:1 
%     v = zeros(1,n);   % Initialization of v-function for the actual step
%     for s = 1:n                                   
%         prob = MDP.T(s,:,pi(s));                  % Transistion propability
%         reward = MDP.R(s,:,pi(s));                % Reward
%         s_next = find(MDP.T(s,:,pi(s))~=0);       % Next state
%         for j = 1:length(s_next)                  
%             v(s) = v(s) + prob(s_next(j)) * (reward(s_next(j)) + gamma * v_previous(s_next(j))); % Bellman equation for v-function
%         end
%     end
%     v_previous = v;               % Copy of v-function for the next step
% end
% end


% function v = Policy_Evaluation_Two_Iterations(MDP,pi,gamma)
% %% Description: Policy-Evaluation algorithm in MATLAB
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Input:    MDP      Markov decision process
% %           pi       strategy
% %           gamma    discount factor
% %
% % Output:   v        state value function (v-function)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %% Parameters and initialization
% n = length(MDP.States);                % Number of states of MDP
% v_previous = zeros(1,n);               % Initialization of v-function for k=0
% 
% %% Loop for exactly "2" iterations
% for k = 1:2
%     v = zeros(1,n);   % Initialization of v-function for the actual step
%     for s = 1:n                                   
%         prob = MDP.T(s,:,pi(s));                  % Transistion propability
%         reward = MDP.R(s,:,pi(s));                % Reward
%         s_next = find(MDP.T(s,:,pi(s))~=0);       % Next state
%         for j = 1:length(s_next)                  
%             v(s) = v(s) + prob(s_next(j)) * (reward(s_next(j)) + gamma * v_previous(s_next(j))); % Bellman equation for v-function
%         end
%     end
%     v_previous = v;               % Copy of v-function for the next step
% end
% end


% function v = Policy_Evaluation_Three_Iterations(MDP,pi,gamma)
% %% Description: Policy-Evaluation algorithm in MATLAB
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Input:    MDP      Markov decision process
% %           pi       strategy
% %           gamma    discount factor
% %
% % Output:   v        state value function (v-function)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %% Parameters and initialization
% n = length(MDP.States);                % Number of states of MDP
% v_previous = zeros(1,n);               % Initialization of v-function for k=0
% 
% %% Loop for exactly "3" iterations
% for k = 1:3 
%     v = zeros(1,n);   % Initialization of v-function for the actual step
%     for s = 1:n                                   
%         prob = MDP.T(s,:,pi(s));                  % Transistion propability
%         reward = MDP.R(s,:,pi(s));                % Reward
%         s_next = find(MDP.T(s,:,pi(s))~=0);       % Next state
%         for j = 1:length(s_next)                  
%             v(s) = v(s) + prob(s_next(j)) * (reward(s_next(j)) + gamma *v_previous(s_next(j))); % Bellman equation for v-function
%         end
%     end
%     v_previous = v;               % Copy of v-function for the next step
% end
% end
