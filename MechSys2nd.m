clc;
clear all;
close all;
F=input('Enter the value for input force F= ');
M=input('Enter the value for Mass M=');
B=input('Enter the value for Damper B=');
K=input('Enter the value for Spring constant K=');
num=[F];
den=[M B K];
sys=tf(num,den)
ltiview(sys);300