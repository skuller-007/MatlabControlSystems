num = input ('Enter the Numerator valve of the Transfer Function: ') 
den = input ('Enter the Denominator valve of the Transfer Function: ') 
disp ('Transfer Function is: ')
t = tf (num,den)
[A,B,C,D] = tf2ss (num,den)
step(A,B,C,D)
eig (A)
if (eig(A) < 0)
system = 1
else
system = 0
end
