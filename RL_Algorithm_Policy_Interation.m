%% Solution to Reinforcement Learning with Policy-Iteration algorithm

%% Creation of the Markov Decision Process
MDP.States = 1:12; % 12 states
MDP.Actions = 1:4; % 4 actions: a1 (left), a2 (down), a3 (right), a4 (up)
MDP.R = zeros(12,12,4); % Initialize the reward matrix

MDP.R(6,5,:) = -1;  % Penalty of -1 if the agent falls into the hole
MDP.R(6,7,:) = -1;  % Penalty of -1 if the agent falls into the hole
MDP.R(4,5,:) = -1;  % Penalty of -1 if the agent falls into the hole
MDP.R(8,7,:) = -1;  % Penalty of -1 if the agent falls into the hole
MDP.R(2,7,:) = -1;  % Penalty of -1 if the agent falls into the hole
MDP.R(11,12,:) = 1; % Reward of +1 if the state s12 is reached

MDP.T = zeros(12,12,4); % Initialize the transition matrix

%% Define the grid for the RL environment
grid = [9, 10, 11, 12;
        8, 7,  6,  5;
        1, 2,  3,  4];

%% Function to find the position of a state in the environment
find_position = @(state) [find(any(grid==state, 2)), find(any(grid==state, 1))];

%% Determination of transition probabilities
for s = MDP.States
    if ~ismember(s, [5, 7, 12]) % States s5, s7, and s12 are terminal states
        position = find_position(s); % Finds the position of the current state in the grid
        row = position(1); % Row position in the grid
        col = position(2); % Column position in the grid
        
        % Left, Right, Up, Down
        left = col - 1; right = col + 1; up = row - 1; down = row + 1;
        if left < 1, left = col; end
        if right > 4, right = col; end
        if up < 1, up = row; end
        if down > 3, down = row; end

        MDP.T(s,grid(row,left),1) = 0.8;    % 80% probability of moving "left"
        MDP.T(s,grid(row,right),3) = 0.8;   % 80% probability of moving "right"
        MDP.T(s,grid(up,col),4) = 0.8;      % 80% probability of moving "up"
        MDP.T(s,grid(down,col),2) = 0.8;    % 80% probability of moving "down"

        % Adjusting transition probabilities for walls
        % If the agent would bump into a wall, it stays in its current state
        if left == col, MDP.T(s,s,1) = 0.1; end 
        if right == col, MDP.T(s,s,3) = 0.1; end
        if up == row, MDP.T(s,s,4) = 0.8; end
        if down == row, MDP.T(s,s,2) = 0; end

        % Orthogonal movements with a 10% probability
        orthogonal_states = setdiff([grid(row,left), grid(row,right), grid(up,col), grid(down,col)], s);
        for os = orthogonal_states
            MDP.T(s,os,:) = MDP.T(s,os,:) + 0.1;
        end
    end
end

pi = ones(1,12)*4;      % Strategy that always chooses "up"
gamma = 0.9;            % Discount factor (γ)
policy_stable = false;  % Initialize a flag for policy stability

while ~policy_stable
    %% Apply Policy-Evaluation
    v = Policy_Evaluation(MDP, pi, gamma);

    %% Apply Policy-Improvement
    new_pi = Policy_Improvement(MDP, v, gamma);

    % If the policy (strategy) has not changed during the improvement step, we have reached the optimal strategy (π*)
    if isequal(pi, new_pi), policy_stable = true; end

    % Update the policy (strategy)
    pi = new_pi;
end

%% Output the state-value function (v-function) and policy (strategy)
disp(v);    % Optimal v-function (v*). There is always one optimal v-function for a given MDP!
disp(pi);   % Optimal strategy (π*). There may be multiple optimal strategies, each leading to the optimal state-value function!
