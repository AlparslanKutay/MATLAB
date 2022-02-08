%% Transfer function of system
m=0.01;
g=9.81;
k=1;
J=100.0;
mu=0.05;
mu_min=0.2;

s = tf('s')

numG=[m*g*k];
denG=[J*m,J*mu,J*mu_min,0,0];

G=tf(numG,denG)