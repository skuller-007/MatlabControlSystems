%Lag compesator using bode plot
clc;
clear all;
close all;
e=5; 
K=input("Enter the gain of OL system:"); %Gain computed from velocity error constant
den=[2 1 0]; %Coefficients of denominator polynomial
G=tf(K,den); %OLTF
figure;
margin(G) %Plots bode graph with GM and PM
PM_des=input("Enter the required phase margin:");
PM_req=PM_des+e; %Additional phase angle
phi_req=PM_req-180
wgc_new=input("Enter the new gain crossover freq:");
[beta,phi]=bode(G,wgc_new)%returns magnitude and phase at wgc_new
T=10/wgc_new
Zc=1/T %Zero of the lag compensator
Pc=1/(beta*T) % Pole of the lag compensator
Gc=tf([1 Zc],[1 Pc]) %TF of lag compensator
sys=(1/beta)*Gc*G % Multiply by (1/beta) to OLTF of compensated system
figure;
margin(sys) %bode plot and GM, PM of compensated system



