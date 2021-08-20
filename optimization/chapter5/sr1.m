function [k,x,val] = sr1(fun,gfun,x0,epsilon,N)
if nargin<5, N=1000; end
if nargin<4, epsilon=1.e-5; end
beta=0.55; sigma=0.4;
n=length(x0); Hk=eye(n); k=0;
while(k<N)
    gk=feval(gfun,x0);
    dk=-Hk*gk;
    if(norm(gk)<epsilon), break; end 
    m=0; mk=0;
    while(m<20)
        if(feval(fun,x0+beta^m*dk)<=feval(fun,x0)+sigma*beta^m*gk'*dk)
            mk=m; break;
        end
        m=m+1;
    end
    x=x0+beta^mk*dk;
    sk=x-x0; yk=feval(gfun,x)-gk;
    Hk=Hk+(sk-Hk*yk)*(sk-Hk*yk)'/((sk-Hk*yk)'*yk);
    k=k+1; x0=x;
end
val=feval(fun,x0);
end