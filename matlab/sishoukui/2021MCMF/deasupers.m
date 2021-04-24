function [W,Q,T,I]=deasupers(X,Y)%X的输入为行为决策单元,列为指标
X=X';
Y=Y';
n=size(X',1);%决策单元个数
m=size(X,1);%输入指标个数
s=size(Y,1);%输出指标个数
b=zeros(n-1,1);
LB=zeros(m+s,1);UB=[];
for i=1:n
    Aeq=[X(:,i)' zeros(1,s)];
    beq=1;
    f=[zeros(1,m) -Y(:,i)'];
    if i==1
        A=[-X(:,2:n)' Y(:,2:n)'];
    elseif i==n
        A=[-X(:,1:n-1)' Y(:,1:n-1)'];
    else
A=[[-X(:,1:i-1) -X(:,i+1:n)]' [Y(:,1:i-1) Y(:,i+1:n)]'];
    end
    if(sum(linprog(f,A,b,Aeq,beq,LB,UB))~=0)
    w(:,i)=linprog(f,A,b,Aeq,beq,LB,UB);
    E(1,i)=Y(:,i)'*w(m+1:m+s,i);
    else w(:,i)=zeros(7,1);
        E(1,i)=Y(:,i)'*w(m+1:m+s,i);
    end
end
W=w'
Q=E
[T,I]=sort(E)
end
