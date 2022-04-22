# Ball and Pipe Control System 
MATLAB codes open serial communication with a ball and pipe system. The system is made of a vertical cylinder with a ping pong ball controlled by a fan on the bottom and height measured by a time of flight sensor on top. The objective is to balance the ball at a target altitude. 

# Theory of Control Method and Application
The control method used for this system is Q learning. Q learning is a machine learning algorithm designed to train an "agent" in an environment. In this project, the agent of the control system is the fan. The idea of Q learning is to use continuous Q values (action values?) to continually improve the learning behavior of the agent. 

Two parts: Background theory and brief application on MATLAB files

Theory

To better understand what Q learning is, it is important to first explain what reinforcement learning is. Reinforcement Learning is the idea of using artifical intelligence to achieve a goal in a complex environment. To train the machine to do what the programmer wants, artifical intelligence is implement to reward or penalize the agent based on an action it performs. By using this approach, it trains the agent in the environment to maximize the desired reward. 

Q learning is a branch of Reinforcement Learning that uses Q values (also known as action values) to continually improve the learning behavior of the agent in an environment. This is done by using a Q-Table to guide the agent to make the best possible action at each state. A general guideline for implementing this type of algorithm is picture below:

As seen from the figure before, the main steps are to initialize a Q-table, pick an action, perform it, and based on the result imrpvoe the the agent to meet the desired outcome. The Bellman's Equation..



Application

When it comes to implementing this into the project, the idea is that we want the ball to reach a certain spot within the pipe. In order to do this, the fan is trained to adjust its fan speed depending on where the ball is located. (Need more explanation on Q tables here). Then a random fan speed is selected by the programmer. Based on the readings for ball position and velocity, the agent will learn to adjust based on where the ball is located in the pipe. By using the Bellman's Equation and continually updating results in a Q-Table, we can create a simulation to adjust the fan speed properly. The algorithm will continue to loop until the ball stays constant at the spot in the pipe.

To implement this in MATLAB, the first step is to establish the control variables of the system. These control variables are ball position (p), fan speed (f), and velocity (v). 

# Guide to use the code
Steps (Need a step for simulation, not sure of the exact order)
Hightlight: errors with snippets of code, why the error is being caused and what we would do to fix it

1. Binned State - This file establishes the control variables of the system. These are ball position, fan speed, and velocity. These values are assigned to "read_pwm" which will be used to transfer the readings to the ball and pipe controller. The matrices are then established which will be used to store the values of the ball reading. There are also declared bins for each variable to store all of data obtained These binned values are indexed and concatenated, which stores it in one cell array. This one cell array would be used for
 
2. Sample State
3. State Space Size - The position of the ball will be divided into 21 spots, from 0 to 20. Each position will be considered as a bin. In each case it will record a velocity pertaining to the bin. The state space size will be the number of permuations of each position and velocity. Instantiate S1 S2 S3 bins and the S1 S2 S3 counters. The we create a for loop that will increase the counters by 1 and set it as a parameter for each bin for everytime the ball position increases.

4. Get Action
5. Get Reward 
6. Bellman's EQ 
7. Q learning - this is the file that calls all of these functions together

# Contact
Matthew Buchinski: buchin84@students.rowan.edu \
Yazhini Kumaravadivelan:  kumara26@students.rowan.edu \
Oscar Mahecha: mahech38@students.rowan.edu \
Shauna Yodice: yodice13@students.rowan.edu \
Richard Rivera: rivera156@students.rowan.edu



# Acknowledgements
Sources
