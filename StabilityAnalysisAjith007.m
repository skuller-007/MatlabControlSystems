clc;
clear all;
close all;
num=[1];
den=[1 6 5 0];
sys=tf(num,den) %open loop transfer function 
w=logspace(-1,2,400); %define freq in log scale
for k=1:40
    [mag,phase,w]=bode(k*sys,w); %returns mag, phase of the open loop system for the given freq
    [gm,pm,wgc,wpc]=margin(mag,phase,w); %returns gain margin,phase margin, gain and phase crossover freq
    fprintf('Gain:'); disp(k);
    fprintf('Gain Cross over frequency:'); disp(wgc);
    fprintf('Phase Cross over frequency:'); disp(wpc);
end
%Bode plot and step response of stable system 
k1=input('Enter Gain value for stable system:'); %wgc>wpc, k1=29
figure;
bode(k1*sys,w);
sys1=feedback(k1*sys,1);
figure;
step(sys1);
 
%Bode plot and step response of marginally stable system
k2=input('Enter Gain value for marginally stable system:'); %wgc=wpc, k2=30
figure;
bode(k2*sys,w);
sys2=feedback(k2*sys,1);
figure;
step(sys2);
 
%Bode plot and step response of unstable system
k3=input('Enter Gain value for unstable system:'); %wgc<wpc, k3=31
figure;
bode(k3*sys,w);
sys3=feedback(k3*sys,1);
figure;
step(sys3);
