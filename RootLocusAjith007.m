clc;
clear all;
close all;
num=[1];
den=[1 3 2 0];
sys=tf(num,den)
cl_sys=feedback(sys,1)
figure(1);
step(cl_sys);
figure(2);
rlocus(num,den);
z=input('Enter the value for zeta');
w=input('Enter the value for omega n ');
sgrid(z,w);
[k,poles]=rlocfind(num,den);
new_clsys=feedback(sys*k,1)
figure(3);
step(new_clsys);