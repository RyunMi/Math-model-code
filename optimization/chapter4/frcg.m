function [k,x,val] = frcg(fun,gfun,x0,epsilon,N)
if nargin<5, N=1000; end
if nargin<4, epsilon=1.e-5; end
beta=0.6; sigma=0.4;
n=length(x0); k=0;
while(k<N)
    gk=feval(gfun,x0); 
    itern=k-(n+1)*floor(k/(n+1));
    itern=itern+1;
    if(itern==1)
        dk=-gk;
    else
        betak=(gk'*gk)/(g0'*g0);
        dk=-gk+betak*d0; gd=gk'*dk;
        if(gd>=0.0), dk=-gk; end
    end
    if(norm(gk)<epsilon), break; end
    m=0; mk=0;
    while(m<20) 
    if(feval(fun,x0+beta^m*dk)...
            <=feval(fun,x0)+sigma*beta^m*gk'*dk)
        mk=m; break;
    end
    m=m+1;
    end
    x=x0+beta^mk*dk;
    g0=gk; d0=dk;
    x0=x;  k=k+1;
end
val=feval(fun,x);
end