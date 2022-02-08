

%% Bandwidth of system

s=tf('s');

Gs= (s+5)/((s+1).*(s^2+15.*s+36));

bode(Gs);
%% I have to pick wb between 1000 to 2000 and the magnitude should be 3.


s=tf('s');
Gs = (s+5)/((s+1)*(s^2+15*s+36));
%%I took these value for some similar questions for catching the wb values
%%, else I could not solved this question. So, I would like to tell you
%%this situation. And also I took wb = 1500 for all Kp_i_d values.

Kp=5.12e5;
Kd=1081;
Ki=4.56e7;
C=pid(Kp,Ki,Kd);
sys=feedback(C*Gs,1)

bode(sys)
stepinfo(sys)


