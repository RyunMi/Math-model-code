function [x,res]=nels(A,b)
B=A'*A; f=A'*b;
L=chol(B,'lower');
y=L\f; x=L'\y;
res=norm(b-A*x);
end

