clear all
close all
n=input('Enter the Coefficients of Numerator')
d=input('Enter the Coefficients of Denominator') %enter as array [1 11 28 0]
'G1(s)'
G1=tf(n,d)
G2=tf(conv([1 0],n),d); % this is for evaluating the Kv we multiply numerator with s.
M=input('Enter peak overshoot: ')
z=sqrt(log(M)^2 /(pi^2 + log(M)^2)) % calulate damping ratio
wn=input('Enter wn: ')
Kv=input('Enter velocity constant: ')
Sd=complex((-z*wn),(wn*sqrt(1-z^2))) % forming the dominant pole
rlocus(G1)  % plotting uncompensated root locus
hold on
plot(Sd,'*') % mark the dominant pole
p = pzmap(G1)  % make pole zero plot.
hold on
plot(Sd,'*')  % mark the dominant pole
plot(conj(Sd),'*')
Po=roots(d)
pang=zeros(1,size(Po,1));
% Finding the angle contributions of poles
for i=1:size(Po,1)
pang(i)=abs(atand((abs(imag(Sd))-abs(imag(Po(i,1))))/(abs(real(Sd))-abs(real(Po(i,1))))));
if(real(Po(i,1))>real(Sd))
pang(i)=180-pang(i);
end
end
Zo=roots(n);
zang=zeros(1,size(Zo,1));
% Finding the angle contributions of zeroes
for i=1:size(Zo,1)
zang(i)=abs(atand((abs(imag(Sd))-abs(imag(Zo(i,1))))/(abs(real(Sd))-abs(real(Zo(i,1))))));
if(real(Zo(i,1))>real(Sd))
zang(i)=180-zang(i);
end
end
thetap=sum(pang);
thetaz=sum(zang);
'Required Phase Lead'
phm=thetap-thetaz-180
phmh=phm;
t=1;
% LOGIC TO CHECK IF PHASE LEAD IS GREATER THAN 60 in some cases it can be 4 times greater than 60 then we have to repeatedly divide it till less than 60
while phmh>60
phmh=phm/(2*t)
t=t+1;
end
t=2*(t-1);
ph1=180-atand(abs(imag(Sd))/abs(real(Sd)));
ph1=ph1/2;
c=(real(Sd))-((imag(Sd))/tand(ph1));
ph=ph1-(phmh);
pol=(real(Sd))-((imag(Sd))/tand(ph))
ph=(ph+phmh);
zer=(real(Sd))-((imag(Sd))/tand(ph))
Gc=tf([1 -zer],[1,-pol]) % 'The lead Compensator'
% 'Open Loop Transfer Function K=1'
if phmh==phm
Go=Gc*G1;
sG=Gc*G2; % For evaluating error constant
else
Go=(Gc^t)*G1
sG=(Gc^t)*G2 % For evaluating error constant
end
sG=minreal(sG); % For evaluating error constant
rlocus(Go)
plot(Sd,'*')
[K a]=rlocfind(Go)
Kvn=dcgain(K*sG); % For evaluating error constant
if Kvn>=Kv
'Condition is satisfied';
Kvn
else
'Improve design';
Kvn
end
Go=Go*K %'The Complete transfer open loop function'
rlocus(Go)
hold on
plot(Sd,'*')