function [mk,alpha, newxk, fk, newfk] =armijo(xk,dk)
beta=0.5; sigma=0.2; 
m=0; maxm=20; 
while (m<=maxm)
    if(fun1(xk+beta^m*dk)<=fun1(xk)+sigma*beta^m*gfun1(xk)'*dk)
mk=m; break; 
    end
    m=m+1;
end
alpha=beta^mk;
newxk=xk+alpha*dk;
fk=fun1(xk);
newfk=fun1(newxk);
end
