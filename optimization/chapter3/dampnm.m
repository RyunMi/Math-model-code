function [k,x,val]=dampnm(fun,gfun,Hess,x0,epsilon)
%阻尼牛顿法程序
a=[];b=[];c=[];
maxk=5000; 
beta=0.5; sigma=0.4; k=0;
while(k<maxk)
    gk=feval(gfun,x0); 
    Gk=feval(Hess,x0); 
    dk=-Gk\gk; 
    if(norm(gk)<epsilon), break; end 
    m=0; mk=0;
    while(m<20) 
        if(feval(fun,x0+beta^m*dk)...
            <=feval(fun,x0)+sigma*beta^m*gk'*dk)
            mk=m; break;
        end
        m=m+1;
    end
    a=[a,x0(1)];
    b=[b,x0(2)];
    c=[c,feval(fun,x0)];
    disp(a);disp(b);
    x0=x0+beta^m*dk; k=k+1;
end
subplot(1,3,1)
plot(a);
title('x的第一个分量')
subplot(1,3,2)
plot(b);
title('x的第二个分量')
subplot(1,3,3)
plot(c);
title('函数值');
x=x0;
val=feval(fun,x);
end