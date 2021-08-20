function [k,x,val] = lmm(Fk,JFk,x0,epsilon,N)
if nargin<5, N=1000; end
if nargin<4, epsilon=1.e-5; end
beta=0.55; sigma=0.4;
n=length(x0);
muk=norm(feval(Fk,x0));
k=0;
while(k<N)
    fk=feval(Fk,x0);
    jfk=feval(JFk,x0);
    gk=jfk'*fk; dk=-(jfk'*jfk+muk*eye(n))\gk;
    if(norm(gk)<epsilon), break; end
    m=0; mk=0;
    while(m<20)
        fnew=0.5*norm(feval(Fk,x0+beta^m*dk))^2;
        fold=0.5*norm(feval(Fk,x0))^2;
        if(fnew<fold+sigma*beta^m*gk'*dk)
            mk=m; break;
        end
        m=m+1;
    end
    x0=x0+beta^mk*dk;
    muk=norm(feval(Fk,x0));
    k=k+1;
end
x=x0;
val=0.5*muk^2;
end