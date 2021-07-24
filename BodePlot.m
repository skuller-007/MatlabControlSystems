%Lag Compensator using bode plot:
K=5;
d1=[2 1 0] % used to formulate the polynomial
G=tf(K,d1) % generate the transfer function.
figure
margin(G)
pmreq=input('Enter Required Phase Margin'); %enter 40 as given in question
pmreq=pmreq+5
phgcm=pmreq-180
wgcm=input('Enter new gain cross over frequency'); % Enter the new gain crossover frequency = 0.5rad/sec
[Beta,p]=bode(G,wgcm)
T=10/wgcm
Zc=1/T
Pc=1/(Beta*T)
Gc=tf([1 Zc],[1 Pc])
sys=Gc*G/Beta
figure
margin(sys)