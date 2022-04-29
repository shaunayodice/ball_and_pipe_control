# Ball and Pipe Control System 
MATLAB codes open a serial communication with a ball and pipe system. The system is made of a vertical cylinder with a ping pong ball controlled by a fan on the bottom and height measured by a time of flight sensor on top. The objective is to balance the ball at a target altitude. 

![image](https://user-images.githubusercontent.com/85361948/165792705-d0223b4c-456b-4d7c-b807-b0f6fce2f091.png)


# Theory of Control Method and Application
The control method used for this system is Q learning. Q learning is a machine learning algorithm designed to train an "agent" in an environment. In this project, the agent of the control system is the fan. The idea of Q learning is to use continuous Q values (action values?) to continually improve the learning behavior of the agent. 

Two parts: Background theory and brief application on MATLAB files

Theory

To better understand what Q learning is, it is important to first explain what reinforcement learning is. Reinforcement Learning is the idea of using artificial intelligence to achieve a goal in a complex environment. To train the machine to do what the programmer wants, artificial intelligence is implemented to reward or penalize the agent based on an action it performs. By using this approach, it trains the agent in the environment to maximize the desired reward. 

Q learning is a branch of Reinforcement Learning that uses Q values (also known as action values) to continually improve the learning behavior of the agent in an environment. This is done by using a Q-Table to guide the agent to make the best possible action at each state. A general guideline for implementing this type of algorithm is pictured below:

![image](https://user-images.githubusercontent.com/85361948/165179507-81ee6117-67b9-4d05-855f-4b4429737a4b.png)


As seen from the figure before, the main steps are to initialize a Q-table, pick an action, perform it, and based on the result improve the agent to meet the desired outcome. The Bellman's Equation is set up to reward the agent for a desired behavior, and punish the agent for an undesirable wrong.

Application

When it comes to implementing this into the project, the idea is that we want the ball to reach a certain spot within the pipe. In order to do this, the fan is trained to adjust its fan speed depending on where the ball is located. A random fan speed is selected by the programmer. Based on the readings for ball position and velocity, the agent will learn to adjust based on where the ball is located in the pipe. By using the Bellman's Equation and continually updating results in a Q-Table, we can create a simulation to adjust the fan speed properly. The algorithm will continue to loop until the ball stays constant at the spot in the pipe.

To implement this in MATLAB, the first step is to establish the control variables of the system. These control variables are ball position (p), fan speed (f), and velocity (v). 

# Guide to use the code 
Steps 

1. Binned State

This file establishes the control variables of the system. These are ball position, fan speed, and velocity. These values are assigned to "read_pwm" which will be used to transfer the readings to the ball and pipe controller. The matrices are then established which will be used to store the values of the ball reading. There are also declared bins for each variable to store all of data obtained These binned values are indexed and concatenated, which stores it in one cell array. This one cell array will be used for easily testing the simulation.

Code for function Binned state : https://github.com/shaunayodice/ball_and_pipe_control/blob/main/binned_state.m

2. Sample State

The function sample ensures that the ball begins in a different position each time the system is sampled ( Random state initialization).The sample state contains three distinct sample variables. Each variable in the binned state corresponds to a bin (p bins, v bin, and f bin correspond to the p, v, and f samples, respectively). Each bin contains discrete samples, which are chosen at random by the P sample, V sample, and F sample functions and used to calculate the position in the pipe. The function Sample stores the final sample position.

Code for function Sample state : https://github.com/shaunayodice/ball_and_pipe_control/blob/main/Sample_state.m

3. Index

There is a matrix with values of all the position, velosity and fan speed. The index function runs through matrix and finds the specific index of each of them.

Since the state space size is three, it will also have to be instantiated as state_variables = 3. The position of the ball will be divided into 21 spots, from 0 to 20. Each position will be considered as a bin. In each case it will record a velocity pertaining to the bin. The Index will be the number of permutations of each position and velocity. Instantiate S1 S2 S3 bins and the S1 S2 S3 counters. Then we create a for loop that will increase the counters by 1 and set it as a parameter for each bin for every time the ball position increases.

Code for function Index : https://github.com/shaunayodice/ball_and_pipe_control/blob/main/index.m

4. Get Action

The get_action function has parameters of episodes, number of episodes, quality ‘Q,’ actions, position bins, velocity bins, and fan bins. The success rate is set equal to one since it is the highest probability we are trying to achieve. The initial epsilon value is set to a half and the exponential decay is set to the 0.95 that remains. Next we must initiate the action index and check the best action against the Q-Table. If the random variable is greater than the epsilon or if the episodes are equal number of episodes and the random variable is less than or equal to the success rate then it finds the best action. Otherwise it's going  to select a random action.

Code for function Get Action : https://github.com/shaunayodice/ball_and_pipe_control/blob/main/get_action.m

5. Get Reward 

The get reward function compares the current state of the ball to the user's desired state and returns a 1 or -1 point (1 point if it performs the intended action, -1 point if it fails to perform the user's desired action). An if-else statement is included in the function to get reward (If the next state does not equal the terminal, the function returns -1; otherwise, the function returns 1).

Code for function Get Reward : https://github.com/shaunayodice/ball_and_pipe_control/blob/main/get_reward.m

6. Bellman's EQ

Bellman's Equation is needed to be defined in Matlab and by looking at the figure below, you can see what are the variables needed to be defined and the certain parameters it needs to take.

![image](https://user-images.githubusercontent.com/85361948/165178025-aa40c955-267b-4b74-a1b6-95fa9368b7a2.png)

Q is the product of the state and action which is just defined as function Q = bellmans(Q, r, s, next_state, a, y). In this case you want to define variables such as r, s, next_state, a and y. Q(idx0,:) = Q(idx0,:) + a*(r + y*max(Q(idx,:)) - Q(idx0,:)); Here are all the parameters Q and all the values in the array. The last step for this code is to equate ‘s’ with ‘next_state.’ 

Code for function Bellman's Eq : https://github.com/shaunayodice/ball_and_pipe_control/blob/main/bellmans.m

7. Real World Q-Learning

This code connects the apparatus to the serialport on the device that is running the software to control the PWM fan. This code takes in the parameters of the desired height of the ball and the sampling rate of the control actions. Once providing the initial burst to lift the ball, the code initializes a feedback loop that reads the current height of the ball and prepares the code for the transfer function to simulate the ball. The code takes the transfer function calculatesd and simulates it through lsim(), calculates the errors, and updates the action.

Code for Real World Q-learning file : https://github.com/shaunayodice/ball_and_pipe_control/blob/main/real_world_q_learning.m

8. Q-Learning

This code is the overall top-level entity for the whole project. The purpose of this function is to implement the functionality of Q-Learning. The code calls to all of the other functions that were created for the individual parts of the reinforcement learning. 

Code for Q-learning file : https://github.com/shaunayodice/ball_and_pipe_control/blob/main/q_learning.m

#Troubleshooting and Future Improvements \
![image](https://user-images.githubusercontent.com/85361948/165789190-a69f2835-f285-4e54-9e58-270f25643c9d.png) \
We encountered an error with the perm function in our q_learning file, whose ideal function is to return a matrix containing all permutations of the elements length(p bins), length(v bins), and length(F bins) in reverse lexicographic order. One solution is to use the perm function separately for each length (bin) and create a matrix called state space that combines all of the values from each perm function of length bin. 

Real world q learning: \
![image](https://user-images.githubusercontent.com/85361948/165789533-3225ccfa-ecfe-4b2f-9c30-89be874c65d0.png) \
We encountered an error with an unrecognized variable in our real_world_q_learning file, despite the fact that the variable was initialized. We believe this error is caused by failing to initialize the variable in the correct file location. One solution is to locate the appropriate location in the Matlab file and initialize the variable.

Get action: \
![image](https://user-images.githubusercontent.com/85361948/165789738-e197a7d7-03f3-4d45-84b0-5a93c0e84407.png) \
We encountered an invalid error in our get_action function, which stated that when calling a function, we must use parentheses, despite the fact that we had already used parentheses. This may be an issue with how the data types are set up with our function.

Binned state: \
![image](https://user-images.githubusercontent.com/85361948/165790370-bef86c62-dc1f-450c-bacc-9d4818544627.png) \
We encountered an error with an unrecognized variable ‘device’ in our binned_state function.We believe this error is caused by not connecting the device (ball and pipe system) to our computer. One solution to this problem is to conduct additional tests with the actual ball and pipe system to see if we still encounter this issue.

Bellmans: \
![image](https://user-images.githubusercontent.com/85361948/165790609-03a206ee-7abd-4c46-8b4c-31b186bc7bde.png) \
When we ran our bellmans function code we ran into an error stating the variable ‘idx0’ is unrecognized. One way to fix this issue is to call the index function inside the bellman's  function then initialize the idx0 variable.

Index: \
![image](https://user-images.githubusercontent.com/85361948/165790731-87358ada-6778-4134-874f-25c13ff45577.png) \
We encountered an invalid error in our Index function, which stated that when calling a function, we must use parentheses, despite the fact that we had already used parentheses. This may be an issue with how the data types are set up with our function.

Is Done: \
![image](https://user-images.githubusercontent.com/85361948/165790869-4e3c4a5d-cc92-4a80-b5af-7d2b55ff756b.png) \
We encountered an error with an unrecognized variable ‘device’ in our Is_done function.We believe this error is caused by not connecting the device (ball and pipe system) to our computer. One solution to this problem is to conduct additional tests with the actual ball and pipe system to see if we still encounter this issue.

Sample State: \
![image](https://user-images.githubusercontent.com/85361948/165790969-2487049b-0fe0-4bd6-b5a1-3512981d714d.png) \
When we ran the sample_state function code we ran into an error that stated ‘reference to a cleared variable V_bins’. One of the solutions that is mentioned online is to remove "clear all" from the code. 

Get Reward: 

NO ERRORS here! When next_state is at the desired state, reward equals 1 and otherwise reward returned is -1. 
![image](https://user-images.githubusercontent.com/85361948/165791166-6f74ae12-d7e9-43f6-b457-0e81dce93b4e.png) 

While the framework for Q learning is properly set up, these errors need to be troubleshooted in order to get the simulation to start reading the values of the control system.

# Contact
Matthew Buchinski: buchin84@students.rowan.edu \
Yazhini Kumaravadivelan:  kumara26@students.rowan.edu \
Oscar Mahecha: mahech38@students.rowan.edu \
Shauna Yodice: yodice13@students.rowan.edu \
Richard Rivera: rivera156@students.rowan.edu



# Acknowledgements / References
1. "Q-learning," Wikipedia, 30-Jan-2022. [Online]. Available: https://en.wikipedia.org/wiki/Q-learning. [Accessed: 18-Feb-2022]. \
2.  C. Shyalika, “A beginners guide to Q-learning,” Medium, 13-Jul-2021. [Online]. Available: https://towardsdatascience.com/a-beginners-guide-to-q-learning-c3e2a30a653c. [Accessed: 18-Feb-2022]. \
3.  V. Ganapathy, Soh Chin Yun and Halim Kusama Joe, "Neural Q-Learning controller for mobile robot," 2009 IEEE/ASME International Conference on Advanced Intelligent Mechatronics, 2009, pp. 863-868, doi: 10.1109/AIM.2009.5229901



