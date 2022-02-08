clear
close all
clc
%%
s=tf('s');


T =(((s+5))/((s+1).*(s^2+15.*s+36)))

bode(T)

rA = 2000;
rT = 2/160;
rw = 2*pi/rT

w = logspace ( -1, 3 , 1000);

bode(T,w);


TMagdB = -108;

TMag = 10^(TMagdB/20);

TAng = -179;

yA= rA*TMag;

yAng = pi*TAng/180

disp(['y_ss(t)=' num2str(yA) 'sin(' num2str(rw) 'pi t' num2str(yAng) ')' ])













