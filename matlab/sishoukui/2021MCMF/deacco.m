function [W,Q,T,I] =deacco (X,Y) %所输入矩阵X的 %行为决策单元，列为指标
X=X'; Y=Y'; n=size (X',1) ; %决策单元个数 
m=size (X,1) ; %输入指标个数 
s=size (Y,1) ; %输出指标个数 
A= [-X' Y'] ; b=zeros(n,1) ; LB=zeros(m+s,1) ;UB=[] ; 
for i=1:n 
    Aeq= [X(:,i)' zeros(1,s)] ; beq=1; f= [zeros(1,m) -Y(:,i)'] ; 
    w(:,i) =linprog(f,A,b,Aeq,beq,LB,UB) ; 
    E(1,i) =Y (:,i)'*w (m+1:m+s,i) ;
end
W=w';
Q=E;
[T,I]=sort(E);
end