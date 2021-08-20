function []=F_P_Iteration(f,x0)
%%
%初始设置
syms x
f(x)=f;
m=20;TOL=1e-6;
df(x)=diff(f(x));
a=-100;b=100;
phi=df(a:0.05:b);
x1=x0;
t=0;
%%
%判断是否收敛
if  abs(double(phi)) <= 1
    disp('具有全局收敛性');
end
%%
%迭代
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
    disp('不动点为:');
    disp(double(xx));
else
    warning('未迭代到解');
end
%%
%判断收敛阶
if t==1
    c=zeros(1,7);
%    delta(x)=0;
    for j = 1:7
        delta(x)=diff(f,j);
        c(j)=double(delta(xx));
    end
    I1=find(c,1,'first');
    disp('收敛阶为：');
    disp(I1);
end
end