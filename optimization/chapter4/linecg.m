function [k,x,val]=linecg(A,b,x0,epsilon,N)
%ÏßÐÔ¹²éî
if nargin<5, N=1000; end
if nargin<4, epsilon=1.e-5; end
if nargin<3, x0=zeros(length(b),1); end
k=0;
gk=A*x0-b;
dk=-gk;
while(k<N)
    temp=A*dk;
    alpha=-gk'*dk/(dk'*temp);
    x=x0+alpha*dk;
    gk=A*x-b;
    betak=gk'*temp/(dk'*temp);
    dk=-gk+betak*dk;
    if(norm(gk)<epsilon), break; end
    x0=x;
    k=k+1;
end
val=0.5*x'*A*x-b'*x;
end