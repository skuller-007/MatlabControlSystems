clc;
clear all;
close all;
F=input('Enter the value for input force F= ');
M=input('Enter the value for Mass M=');
B=input('Enter the value for Damping coefficient B=');
num=[F];
den=[M B];
sys=tf(num,den)
ltiview(sys);
