clc;
clear all;
close all;
n=input('Enter the value for time ');
a=input('Enter the value for Amplitude ');
t=-n:1:n;
y=[zeros(1,n+1),a*ones(1,n)];
stem(t,y);
ylabel('Amplitude');
xlabel('Time');
title('Step Signal');