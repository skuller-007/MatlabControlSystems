clc;
clear all;
close all;
F=input('Enter the value of Force F=');
M=input('Enter the value of Mass M=');
B=input('Enter the value of Damping coefficient B=');
K=input('Enter the value of Spring constant K=');
num=[F];
den=[M B K];
sys=tf(num,den)
subplot(2,1,1);
impulse(sys);
title('Mechanical system Impulse response');
ylabel('Displacement');
subplot(2,1,2);
step(sys);
title('Mechanical system Step response');
ylabel('Displacement');