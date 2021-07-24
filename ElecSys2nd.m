
clc;
clear all;
close all;
V=input('Enter the value for input voltage V=');
R=input('Enter the value for resistance R= ');
C=input('Enter the value for capacitance C=');
L=input('Enter the value for inductance L=');
s=tf('s');
sys=V/(((s^2)*L*C)+(s*R*C)+1)
subplot(2,1,1);
impulse(sys);
title('Impulse response for RLC circuit');
ylabel('output voltage');
subplot(2,1,2);
step(sys);
title('Step response for RLC circuit');
ylabel('output voltage');
ltiview(sys);