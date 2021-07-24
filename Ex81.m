clc;
clear all;
close all;
ess=input("Enter required steady state error:"); %ess=1/15
Kv=1/ess %computes velocity error constant
K=input("Enter the value of gain for required steady state error:");%K=15
%in this case K = Kv --> compute manually and enter
e=5; %additional phase angle
s=tf('s');
G=K/(s*(s+1)) %OLTF of uncompensated system
[GM,PM,wgc,wpc]=margin(G); %returns the freq domain specs
%PM is the phase margin of uncompensated system
PM_des=input("Enter desired phase margin:"); %PM_des=45 
phi_req=PM_des-PM+e %compute required phase margin from lead compensator
alpha=(1-sind(phi_req))/(1+sind(phi_req)) %computes alpha of lead compensator
%sind command computes sine value of arguments in degree
mag=-20*log10(1/sqrt(alpha)) %computes dB magnitude corresponding to 1/sqrt(alpha)
figure;
bode(G); %Bode plot of uncompensated system
%right click on bode plot and select "all stability margins"
%then run the following code step by step
hold on
yline(mag,'r-') %draw line in mag plot corresponding to value of 'mag'
%read the freq corresponding to 'mag' and enter below
wm=input("Enter the freq of mag:"); %wm=5.34
T=1/(wm*sqrt(alpha)) %computes time constant of lead compensator
zc=1/T %computes zero of lead compensator
pc=1/(alpha*T) %computes pole of lead compensator
Gc=(s+zc)/(s+pc) %TF of lead compensator
sys=(1/alpha)*Gc*G %OLTF of compensated system
figure;
margin(sys) %find the PM of compensated system - will be around 45 degree