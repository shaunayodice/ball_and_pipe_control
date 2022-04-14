%% LSim for ball and pipe
%% written by Shauna Yodice
%% Modified on 4/13/2022

%% NEED TO DO SOMETHING WITH THE D 2700 BUT NOT SURE


% assuming the mass of the ball is 0.01 kg

syms s

g = 9.8;
v_eq = 2.4384;
m_ball = 0.01;
p_air = 1.2250;
v_ball = 2;

t = 0:1:100;

c2 = ((2*g)/ v_eq)*((m_ball-(p_air*v_ball))/m_ball);
c3 = 6.3787 * (10^-4);

G = (c3 * c2);
Y = (s*(s+c2));

W = G / Y;

val = 8625827442053713/4398046511104;

W = tf([-1.2510], [1 1.9613e+03])

u = max(0,min(t-1,1));

state_space = ss(W);
lsim(state_space,u,t)

