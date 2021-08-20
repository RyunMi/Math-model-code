function [d,val,lam,i] = trustq(fk,gk,Bk,deltak)
n=length(gk); beta=0.6; sigma=0.2;
mu0=0.05; lam0=0.05; gamma=0.05;
d0=ones(n,1); z0=[mu0,lam0,d0']';
zbar=[mu0,zeros(1,n+1)]';
i=0;
z=z0; mu=mu0; lam=lam0; d=d0;
while (i<=150)
    H=dah(mu,lam,d,gk,Bk,deltak);
    if(norm(H)<=1.e-8)
        break;
    end
    J=JacobiH(mu,lam,d,Bk,deltak);
    b=psi(mu,lam,d,gk,Bk,deltak,gamma)*zbar-H;
    dz=J\b;
    dmu=dz(1); dlam=dz(2); dd=dz(3:n+2);
    m=0; mi=0;
    while (m<20)
        t1=beta^m;
        Hnew=dah(mu+t1*dmu,lam+t1*dlam,d+t1*dd,...
            gk,Bk,deltak);
        if(norm(Hnew)<=(1-sigma*(1-gamma*mu0)*beta^m)...
            *norm(H))
            mi=m; break;
        end
        m=m+1;
    end
    alpha=beta^mi;
    mu=mu+alpha*dmu;
    lam=lam+alpha*dlam;
    d=d+alpha*dd;
    i=i+1;
end
val=fk+gk'*d+0.5*d'*Bk*d;
end
%%
function p=phi(mu,a,b)
p=a+b-sqrt((a-b)^2+4*mu^2);
end
%%
function H=dah(mu,lam,d,gk,Bk,deltak)
n=length(d);
H=zeros(n+2,1);
H(1)=mu;
H(2)=phi(mu,lam,deltak^2-norm(d)^2);
H(3:n+2)=(Bk+lam*eye(n))*d+gk;
end
%%
function J=JacobiH(mu,lam,d,Bk,deltak)
n=length(d);
J=zeros(n+2,n+2);
t2=sqrt((lam+norm(d)^2-deltak^2)^2+4*mu^2);
pmu=-4*mu/t2;
thetak=(lam+norm(d)^2-deltak^2)/t2;
J=[1, 0, zeros(1,n);
pmu, 1-thetak, -2*(1+thetak)*d';
zeros(n,1), d, Bk+lam*eye(n)];
end
%%
function si=psi(mu,lam,d,gk,Bk,deltak,gamma)
H=dah(mu,lam,d,gk,Bk,deltak);
si=gamma*norm(H)*min(1,norm(H));
end