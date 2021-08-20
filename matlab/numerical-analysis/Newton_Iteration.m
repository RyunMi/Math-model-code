function []=Newton_Iteration(f,x0)
%%
syms x 
f(x)=f;
m=20;TOL=1e-6;
a=-2;b=2;
dy(x)=diff(f(x));
ddy=dy(a:0.05:b);
x1=x0;
t=0;
%%
if (double(f(a))*double(f(b))<0) & (double(ddy)~=0) & (abs(double(f(a))/double(dy(a)))<(b-a)) ...
    & (abs(double(f(b))/double(dy(b)))<(b-a))
    disp('迭代收敛唯一解，收敛阶数为2');
end
%%
for i=1:m
    xx=f(x1);
    if abs(double(xx)-double(x1))<=TOL
        disp('迭代次数为：');
        disp(i);
        t=1;
        break;
    end
    x1=double(xx);
end
if t==1
    disp('解为:');
    disp(double(xx));
else
    disp('未迭代到解');
end
end