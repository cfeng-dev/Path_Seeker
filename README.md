# Reinforcement Learning Homework Solution

This repository contains my homework solution for the Machine Learning course at HTWG Konstanz.

## Prerequisites

To run the MATLAB code in this project, the following toolboxes are required:

-   Statistics and Machine Learning Toolbox
-   Deep Learning Toolbox
-   Reinforcement Learning Toolbox

## Project Description

The RL environment consists of a 4x3 grid with 12 states, where the agent's goal is to navigate to the target state (s12) to receive a reward of +1. Two states represent holes (s5, s7) giving a reward of -1 (penalty) when entered, and all other non-terminal states have no immediate reward.

Movement decisions are stochastic, with an 80% probability of moving in the chosen direction and a 20% combined chance of moving orthogonally. Colliding with a wall keeps the agent in its current state without moving. The agent starts from state s1 and can move in four directions: left (a1), down (a2), right (a3), and up (a4).

### The grid is illustrated below:

```plaintext
+----+----+----+----+
| s9 | s10| s11| s12| <- s12 is the target state with a reward of +1.
+----+----+----+----+
| s8 | s7 | s6 | s5 | <- s7 and s5 are holes with a reward of -1.
+----+----+----+----+
| s1 | s2 | s3 | s4 | <- s1 is the starting state.
+----+----+----+----+
```

## Tasks Accomplished

The following tasks were completed in this project:

1. **Environment Implementation**: The RL environment was implemented in MATLAB, considering the stochastic nature of the agent's movements and the rewards associated with each state.

2. **State-Value Function for "Up" Policy**: Using a Policy-Evaluation-Aligorithmus introduced in the lectures, the state-value function was computed for a fixed policy that always moves 'up'.

3. **Optimal Strategy Computation**: An optimal strategy was computed using Policy-Improvement-Algorithmus discussed in the lectures.

4. **Value Iteration Algorithm**: Taking a Markov Decision Process (MDP) and a discount factor as inputs. The outputs are the state-value function and an optimal strategy. This algorithm was applied to the given MDP with a discount factor of 0.9, enabling the determination of the most beneficial actions without a predefined strategy.
