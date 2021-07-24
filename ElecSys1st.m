clc;
clear all;
close all;
V=input('Enter the value for input voltage V=');
R=input('Enter the value for resistance R= ');
C=input('Enter the value for capacitance C=');
s=tf('s');
sys=V/((s*R*C)+1)
ltiview(sys);