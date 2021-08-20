clc,clear;
prob=optimproblem;
P=xlsread('./day_power.xls');
P=P(:);P(P==0)=[];%P=repmat(P,1,124);P=roundn(P,0);
M=-2;N=2;
x=binvar(124,365,'full');
y=binvar(4,365,'full'); 
z=binvar(4,365,'full');
a=0;
Obj=0;ss=zeros(4,1);
for i = 1:4
    ss(i)=sum(y(i,:))+sum(z(i,:));
end
for i= 1:4
    Obj=Obj+ss(i)-mean(ss);
end
for j=1:365
    a=a+sum(x(:,j)).*P(j);
end
Con=[a<=9850;sum(x,2)>=4;sum(y,1)<=3;sum(z,1)==1;sum(x,1)-sum(y,1)==0;];
%for i=1:3
%    Con=[Con;sum(y(i,:))+sum(z(i,:))==sum(y(i+1,:))+sum(z(i+1,:))];
%end
for k=1:4
    for j=1:365
        Con=[Con;y(k,j)+z(k,j)<=1];
    end
end
for i=1:124
    for t=1:95
        Con=[Con;sum(x(i,t:t+270))>=1];
    end
end
for i=1:124
    for m=3:365
        Con=[Con;(2-x(i,m-2)-x(i,m-1))*M+x(i,m)<=0];
    end
end
for i=1:124
    for m=3:365
        Con=[Con;(1-x(i,m-1)+x(i,m-2))*N+x(i,m)>=1];
    end
end
for i=1:4
    for m=2:364
        Con=[Con;y(i,m-1)-y(i,m)+y(i,m+1)>=0];
    end
end
for i=1:4
    for n=1:359
        Con=[Con;sum(y(i,n:n+6))+sum(z(i,n:n+6))<=6];
    end
end
for i=1:124
    Con=[Con;(x(i,1)-1)*M+x(i,2)>=1];
end
for i=1:4
    for j=3:365
        Con=[Con;(1+y(i,j-2)-y(i,j-1))*N+y(i,j)>=1];
    end
end
for i=1:4
    for j=4:365
        Con=[Con;(2-y(i,j-2)-y(i,j-1)+y(i,j-3))*M+y(i,j)<=0];
    end
end
for i=1:4
    for j=5:365
        Con=[Con;(3-y(i,j-2)-y(i,j-1)-y(i,j-3)+y(i,j-4))*N+y(i,j)>=1];
    end
end
for i=1:4
    for j=6:365
        Con=[Con;(4-y(i,j-2)-y(i,j-1)-y(i,j-3)-y(i,j-4)+y(i,j-5))*M+y(i,j)<=0];
    end
end
for i=1:4
    for j=7:365
        Con=[Con;(5-y(i,j-2)-y(i,j-1)-y(i,j-3)-y(i,j-4)-y(i,j-5)+y(i,j-6))*N+y(i,j)>=1];
    end
end
for i=1:4
    Con=[Con;(y(i,1)-1)*M+y(i,2)>=1];
end
ops = sdpsettings('solver','gurobi');
sol = solvesdp(Con,Obj,ops);
obj = double(Obj);
x = double(x);
y = double(y);
z = value(z);
optimize(Con,Obj)