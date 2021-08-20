clc, clear, close all
sj0=xlsread('C题附件1.xlsx');
x=sj0(2:30,1); x=x(:);
y=sj0(2:30,2); y=y(:);
sj=[x y]; d1=sj0(1,:); 
xy=[d1;sj;d1];
sj=xy*pi/180; %角度化成弧度
d=zeros(31); %距离矩阵d初始化
for i=1:30
   for j=i+1:31
       d(i,j)=6370*acos(cos(sj(i,1)-sj(j,1))*cos(sj(i,2))*cos(sj(j,2))+sin(sj(i,2))*sin(sj(j,2)));
   end
end
d=d+d';
for i = 1:31
    d(i,i)=10000; 
end
n=31;
x=binvar(31,31,'full');
u=intvar(31,1);
f=sum(sum(d.*x));
F=[];
F=[F;sum(x,2)==ones(n,1)];
F=[F;sum(x,1)'==ones(n,1)];
F=[F;u(1)==0];
for i=2:n
    F=[F;1 <=u(i)<= n-1];
end
for i=1:n
    for j=2:n
        F=[F;u(i)-u(j)+n*x(i,j)<=n-1];
    end
end
ops=sdpsettings('solver','gurobi');
sol=solvesdp(F,f,ops);
f=double(f);
u=double(u);
x=double(x);
%%
a=[1:1:31]';
u=[a,u];
sort=sortrows(u,2);
path=sort(:,1);