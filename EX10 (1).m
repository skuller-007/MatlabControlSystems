M=input('Enter Mass: ');
B=intput('Enter Damping Constant: ');
K=input('Enter Spring Constant: ');
F=input('Enter Force: ');
num=[F]
den=[M B K]
sys1=tf(num,den);
subplot(2,1,1);
impluse(sys1);
title("Impluse");
vlabel('Displacement');
subplot(2,1,2);
step(sys1);
title("Step");
ylabel("Displacemnt")