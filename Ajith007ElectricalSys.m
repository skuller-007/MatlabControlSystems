clc;
close all;
clear all;
V=input('Enter input voltage V=');
R=input('Enter resistance R=');
C=input('Enter capacitance C=');
s=tf('s');
sys=V/((s^2*R^2*C^2)+(3*s*R*C)+1)
subplot (2,1,1);
impulse(sys);
title('Electrical system impulse response');
ylabel('output voltage');
subplot (2,1,2);
step(sys);
title('Electrical system step response');
ylabel('output voltage');