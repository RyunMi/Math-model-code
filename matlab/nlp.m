clc,clear
%%
% x=sdpvar(1,1);
% Obj=-200*exp(-0.05*x)*sin(x);
% Con=[-2 <= x <= 2];
%%
%bmibnb、filtersd、snopt、nomad找到最优解，filtersd和snopt最快、bmibnb其次
%xx=-10:0.1:10;yy=-10:0.1:10;
%[X,Y]=meshgrid(xx,yy);
%z=exp(X).*(4.*X.^2+2.*Y.^2+4.*X.*Y+2.*Y+1);
%surf(X, Y, z);
x=sdpvar(2,1);
Obj=exp(x(1))*(4*x(1)^2+2*x(2)^2+4*x(1)*x(2)+2*x(2)+1);
Con=[1.5+x(1)*x(2)-x(1)-x(2)<=0;
   -x(1)*x(2)<=10];
%%
%bmibnb找到最优解
% x=sdpvar(2,1);
% Obj=-(21.5+x(1)*sin(4*pi*x(1))+x(2)*sin(20*pi*x(2)));
% Con=[-3.0 <= x(1) <= 12.1;
%      4.1 <= x(2) <= 5.8];
%%
ops = sdpsettings('solver','bmibnb','debug',1);
tic
sol = solvesdp(Con,Obj,ops);
toc
obj = double(Obj);
x=double(x);