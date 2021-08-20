clc,clear
A=7*rand(8,1);
syms x
f=A(7)*x^7+A(6)*x^6+A(5)*x^5+A(4)*x^4+A(3)*x^3+A(2)*x^2+A(1)*x+A(8);
x0=0.5;
disp('不动点迭代结果:');
for k = 1:7
    g=(f-x^k)^(1/k);
    F_P_Iteration(g,x0);
end
%F_P_Iteration(f,x0);
f=x-f/diff(f);
disp('牛顿迭代法迭代序列为：');
pretty(f);
disp('牛顿迭代结果:');
Newton_Iteration(f,x0);
syms x y 
F=x.^2+(5/4.*y-sqrt(abs(x))).^2-4; 
fimplicit(F,[-3,3 -3,3])


