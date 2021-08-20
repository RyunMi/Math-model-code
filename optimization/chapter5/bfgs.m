function [k,x,val] = bfgs(fun,gfun,x0,varargin)
N=1000;
epsilon=1.e-5;
beta=0.55; sigma=0.4;
n=length(x0); Bk=eye(n);
k=0;
while(k<N)
    gk=feval(gfun,x0,varargin{:});
    if(norm(gk)<epsilon), break; end 
    dk=-Bk\gk;
    m=0; mk=0;
    while(m<20)
        newf=feval(fun,x0+beta^m*dk,varargin{:});
        oldf=feval(fun,x0,varargin{:});
        if(newf<=oldf+sigma*beta^m*gk'*dk)
            mk=m; break;
        end
        m=m+1;
    end
    x=x0+beta^mk*dk;
    sk=x-x0;
    yk=feval(gfun,x,varargin{:})-gk;
    if(yk'*sk>0)
    Bk=Bk-(Bk*sk*sk'*Bk)/(sk'*Bk*sk)+(yk*yk')/(yk'*sk);
    end
    k=k+1;
    x0=x;
end
val=feval(fun,x0,varargin{:});
end

