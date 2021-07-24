clc;
clear all;
close all;
num=[1];
den=[1 3 2 0];
sys=tf(num,den) %open loop transfer function
cl_sys=feedback(sys,1) %closed loop transfer function
step(cl_sys); %step response of closed loop system
figure;
rlocus(sys); %root locus of open loop transfer function
z=input('Enter the value of zeta:'); %For 20 % overshoot, z=0.456
w=input('Enter the value of omega n:'); %w=1
sgrid(z,w); %plots the line with z and w given
[k,poles]=rlocfind(sys); %returns the value of gain and poles at a selected point on the root locus
new_clsys=feedback(k*sys,1) %closed loop transfer function of new system with modified gain
figure
step(new_clsys); %step response of new closed loop system