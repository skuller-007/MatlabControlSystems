A= input ('Enter the System Matrix, ‘A’ value:')
B= input ('Enter the Matrix, ‘B’value:')
C= input ('Enter the Output Matrix,’C’ value:')
D= input ('Enter the Transition Matrix,‘d’ value:') 
[num,den] = ss2tf(A,B,C,D) 
g = tf(num,den) 
step(g) 
eig(A)
if (eig(A)< 0)
system = 1 % System '1' represents the stable system
else
system = 0 % System '0' represents the unstable system
end
