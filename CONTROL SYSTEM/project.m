clear
close all
clc

%%

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

%%
%controller
Kp=60;
Kd=30.0;
% Ki=0.02;
%P control
%CC=tf([Kp],[1]);
% PD control
% CC=tf([Kd,Kp],[1])
CC = Kd*s+Kp

%PI control
%CC=tf([Kp,Ki],[1,0]);
%PID control
% CC=tf([Kd,Kp,Ki],[1,0]);

T=feedback(CC*G,1);
pole(T)
zero(T)
step(T)





