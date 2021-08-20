A=[1 2 3 4; 1 4 5 6; 1 5 6 7; 1 8 9 10; 1 11 12 13];
b=[11 13 15 18 20]';
[m,n]=size(A); x=zeros(n,1);
[U,S,V]=svd(A);
r=rank(S);
for i=1:r
    x=x+(U(:,i)'*b/S(i,i))*V(:,i);
end
x
res=norm(b-A*x)