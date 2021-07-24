%% Lag compensator design using Root Locus
clc;
clear all;
close all;
K=1; %Assign K=1
den=[1 10 16 0];%coefficients of denominator polynomial
G=tf(K,den) %OLTF
figure;
rlocus(G) %Root locus of OLTF
M=input("Enter Percentage Overshoot:"); %M=0.16
zeta=sqrt(log(M)^2/(pi^2 +log(M)^2)) %compute damping ratio
sgrid(zeta,0) %select the dominant pole at line cos^(-1) of zeta
[K p]=rlocfind(G) %returns gain and poles at the selected point on root locus
Kvu=input("Enter velocity error constant of uncompensated system:"); %Kvu=1.25
ess=input("Enter the value of required steady state error:"); %ess=0.125
Kvd=1/ess %velocity error constant of desired system
A=Kvd/Kvu %compute the improvement factor in velocity error constants
beta=1.2*A
poles=pole(G) %returns poles of OLTF
poles=sort(poles,'descend') %sort the poles in descending order
T=1/(-0.1*poles(2)) %takes the values of second pole of the OL system
Zc=-1/T %Zero of the lag compensator
Pc=-1/(beta*T) % Pole of the lag compensator
Gc=tf([1 Zc],[1 Pc]) %TF of lag compensator
sys=Gc*K*G %OLTF of compensated system
figure;
rlocus(sys) %root locus of compensated system
