function [k,x,val] = broyden(fun,gfun,x0,epsilon,N)
if nargin<5, N=1000; end
if nargin<4, epsilon=1.e-5; end
beta=0.55; sigma=0.4; phi=0.5;
n=length(x0); Hk=eye(n); k=0;
while(k<N)
    gk=feval(gfun,x0);
    if(norm(gk)<epsilon), break; end
    dk=-Hk*gk;
    m=0; mk=0;
    while(m<20)
        if(feval(fun,x0+beta^m*dk)<=feval(fun,x0)...
        +sigma*beta^m*gk'*dk)
            mk=m; break;
        end
        m=m+1;
    end
    x=x0+beta^mk*dk; sk=x-x0;
    yk=feval(gfun,x)-gk; Hy=Hk*yk;
    sy=sk'*yk; yHy=yk'*Hk*yk;
    if(sy<0.2*yHy)
        theta=0.8*yHy/(yHy-sy);
        sk=theta*sk+(1-theta)*Hy;
        sy=0.2*yHy;
    end
    vk=sqrt(yHy)*(sk/sy - Hy/yHy);
    Hk=Hk-(Hy*Hy')/yHy+(sk*sk')/sy+phi*vk*vk';
    x0=x; k=k+1;
end
val=feval(fun,x0);
end

