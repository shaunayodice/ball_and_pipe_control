# Ball and Pipe Control System 
MATLAB codes open serial communication with a ball and pipe system. The system is made of a vertical cylinder with a ping pong ball controlled by a fan on the bottom and height measured by a time of flight sensor on top. The objective is to balance the ball at a target altitude. 

# Theory of Control Method and Application
The control method used for this system is Q learning. Q learning is a machine learning algorithm designed to train an "agent" in an environment. In this project, the agent of the control system is the fan. The idea of Q learning is to use continuous Q values (action values?) to continually improve the learning behavior of the agent. 

Two parts: Background theory and brief application on MATLAB files

Theory

Application


To implement this in MATLAB, the first step is to establish the control variables of the system. These control variables are ball position (p), fan speed (f), and velocity (v). 

# Guide to use the code
Steps (Need a step for simulation, not sure of the exact order)
Hightlight: errors with snippets of code, why the error is being caused and what we would do to fix it
1. Binned State
2. Sample State


4. Get Action
5. Get Reward 
6. Bellman's EQ
7. Q learning - this is the file that calls all of these functions together

# Contact
Matthew Buchinski: buchin84@students.rowan.edu
Yazhini Kumaravadivlan  kumara26@students.rowan.edu
Oscar Mahecha: mahech38@students.rowan.edu




# Acknowledgements
Sources
