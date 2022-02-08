clear
close all
clc

%%
s=tf('s');

Gc1 = (s+20);
Gc2 = 1/(s.*(s^2+24*s+63));

sys_pd_ol = Gc1*Gc2;

rlocus(sys_pd_ol);

%wd
wd_min = pi/2;

%PD
K= 4.97;
sys_pd_ol = Gc1*Gc2;
sys_pd_cl = minreal(K*sys_pd_ol/(1+K*sys_pd_ol));
sys_pd_cl = feedback(K*sys_pd_ol,1);

figure
sys_pd_step = stepplot (sys_pd_cl);

grid on
ylabel('Y(t)')
title ('Response to step referance with PD control')

sys_pd_step.showCharacteristic('PeakResponse')
sys_pd_step.showCharacteristic('RiseTime')
sys_pd_step.showCharacteristic('SettlingTime')
sys_pd_step.showCharacteristic('SteadyState')

stepinfo(sys_pd_cl)

%% Pi
K= 4.97;
Gc1_pi = (s+20);
Gc2_pi = 1/(s.*(s^2+24*s+63));
sys_pi_ol = Gc1_pi*(Gc2_pi.*1/s);
sys_pi_cl = minreal(K*sys_pi_ol/(1+K*sys_pi_ol));
sys_pi_cl = feedback(K*sys_pi_ol,1);

rlocus(sys_pi_ol)

figure
sys_pi_step = stepplot (sys_pi_cl);

grid on
ylabel('Y(t)')
title ('Response to step referance with PI control')

sys_pi_step.showCharacteristic('PeakResponse')
sys_pi_step.showCharacteristic('RiseTime')
sys_pi_step.showCharacteristic('SettlingTime')
sys_pi_step.showCharacteristic('SteadyState')

stepinfo(sys_pi_cl)


%% PID 
clear
s=tf('s');
K= 4.97;
Gc1_pid = (s+20).*(s+2);
Gc2_pid = 1/(s.*(s^2+24*s+63));
sys_pid_ol = Gc1_pid*(Gc2_pid.*1/s);
sys_pid_cl = minreal(K*sys_pid_ol/(1+K*sys_pid_ol));
sys_pid_cl = feedback(K*sys_pid_ol,1);
rlocus(sys_pid_ol)
figure
sys_pid_step = stepplot (sys_pid_cl);

grid on
ylabel('Y(t)')
title ('Response to step referance with PID control')

sys_pid_step.showCharacteristic('PeakResponse')
sys_pid_step.showCharacteristic('RiseTime')
sys_pid_step.showCharacteristic('SettlingTime')
sys_pid_step.showCharacteristic('SteadyState')

stepinfo(sys_pid_cl)



