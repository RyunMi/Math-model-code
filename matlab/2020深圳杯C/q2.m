clc, clear, close all
sj0=xlsread('C题附件2.xlsx');
x=sj0(2:30,1); x=x(:);
y=sj0(2:30,2); y=y(:);
p=sj0(2:30,3); p=p(:)./3600;
sj=[x y]; d1=sj0(1,1:2); 
xy=[d1;sj;d1];
sj=xy*pi/180; %角度化成弧度
d=zeros(31); %距离矩阵d初始化
for i=1:30
   for j=i+1:31
       d(i,j)=6370*acos(cos(sj(i,1)-sj(j,1))*cos(sj(i,2))*cos(sj(j,2))+sin(sj(i,2))*sin(sj(j,2)));
   end
end
d=d+d';
path=[1,18,21,20,19,26,27,30,22,24,25,29,23,5,4,6,11,14,17,28,16,13,9,12,15,7,8,10,2,3,31];%问题1所求得路径
s=[];
for i=1:30
    s(i)=d(path(i),path(i+1));
end
c=sdpvar(29,1);
a=50;
v=5;
r=1;
f=sum(c);
F=[];
zz=0;
for i=1:29
    zz=zz+(c(i)-a)./(r-p(i));
end
for i=1:29
    F=[F;c(i)-p(i)*(sum((1000*s)./v)+zz-(c(i)-a)./(r-p(i)))>=a];
end
ops=sdpsettings('solver','fmincon','debug',0.5);
sol=optimize(F,f,ops);
a=double(a);
v=double(v);
r=double(r);
c=double(c);
cy=(max(c)-min(c))/min(c);
f=double(c);