function [k,x,val]=revisenm(fun,gfun,Hess,x0,epsilon)
%x0=[-1.2;1.0];
%[k,x,val]=revisenm('fun2','gfun2','Hess1',x0,1e-5)
n=length(x0); maxk=5000; 
beta=0.5; sigma=0.4; tau=0.0; k=0; 
while(k<maxk)
    gk=feval(gfun,x0);
    muk=norm(gk)^(1+tau);
    Gk=feval(Hess,x0);
    Ak=Gk+muk*eye(n);
    dk=-Ak\gk;
    if(norm(gk)<epsilon), break; end 
    m=0; mk=0; 
    while(m<20)
        if(feval(fun,x0+beta^m*dk)...
            <=feval(fun,x0)+sigma*beta^m*gk'*dk) 
        mk=m; break;
        end
        m=m+1;
    end
    x0=x0+beta^mk*dk;
    k=k+1;
end
x=x0;
val=feval(fun,x);
end