clc,clear
Z=xlsread('xyl.xlsx');b=Z(:,end-5:end);
F_1=[-0.73,0.855,0.039,0.051,0.264,0.270];
F_2=[1.034,-0.693,0.225,0.212,-0.023,-0.031];
Y_1=b*F_1';
Y_2=b*F_2';
X=Z(:,2:3);
Y=[Y_1,Y_2];

n=size(X',1);m=size(X,1);s=size(Y,1);epsilon=10^-10;%定义非阿基米德无穷小量ε=10-10 
f=[zeros(1,n),-epsilon*ones(1,m+s),1];
A=zeros(1,n+m+s+1);b=0;LB=zeros(n+m+s+1,1);UB=[];LB(n+m+s+1)=-inf;
for i=1:n;
    Aeq=[[X(:,1:i),zeros(m,1),X(:,i+1:n)],eye(m)
        zeros(m,s)-X(:,i)
        [Y(:,1:i),zeros(s,1),Y(:,i+1:n)],zeros(s,m),-eye(s),zeros(s,1)]
    beq=[zeros(m,1)
        Y(:,i)];
    w(:,i)=linprog(f,A,b,Aeq,beq,LB,UB);%解线性规划,得 DMUi 的最佳权向量wi 
end
w% 输出最佳权向量
lambda=w(1:n,:)
s_minus=w(n+1:n+m,:)
s_plus=w(n+m+1:n+m+s,:)
    theta=w(n+m+s+1,:)