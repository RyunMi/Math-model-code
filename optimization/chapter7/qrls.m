function [x,res]=qrls(A,b)
[Q,R]=qr(A); f=Q'*b;
x=R\f; res=norm(b-A*x);
end
