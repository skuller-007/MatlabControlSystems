clc;
clear all;
close all;
z=input('Enter the value for zeta z=');
w=input('Enter the value for omega n w=');
num=[w*w];
den=[1 2*w*z w*w];
sys=tf(num,den)
ltiview(sys);