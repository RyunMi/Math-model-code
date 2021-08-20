function [k,x,val] = trustm(x0,epsilon)
n=length(x0); eta1=0.1; eta2=0.75;
tau1=0.5; tau2=2.0;
delta=1; dtabar=2.0;
x=x0; Bk=Hess(x);k=0;
while(k<50)
    fk=fun(x);
    gk=gfun(x);
    if(norm(gk)<epsilon)
        break;
    end
    [d,val,lam,i]=trustq(fk,gk,Bk,delta);
    deltaq=fk-val;
    deltaf=fun(x)-fun(x+d);
    rk=deltaf/deltaq;
    if(rk<=eta1)
        delta=tau1*delta;
    else if (rk>=eta2 & norm(d)==delta)
            delta=min(tau2*delta,dtabar);
        else
            delta=delta;
        end
    end
    if(rk>eta1)
        x=x+d;
        Bk=Hess(x);
    end
    k=k+1;
end
val=fun(x);
end

