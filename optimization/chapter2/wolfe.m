function [alpha, newxk, fk, newfk] = wolfe(xk, dk)
rho = 0.25; sigma = 0.75;
alpha = 1; a = 0; b = Inf; 
while (1)
    if ~(fun1(xk+alpha*dk)<=fun1(xk)+rho*alpha*gfun1(xk)'*dk)
        b = alpha;
        alpha = (alpha+a)/2;
        continue;
    end
    if ~(gfun1(xk+alpha*dk)'*dk >= sigma*gfun1(xk)'*dk)
        a = alpha;
        alpha = min([2*alpha, (b+alpha)/2]);
        continue;
    end
    break;
end
newxk = xk+alpha*dk;
fk = fun1(xk);
newfk = fun1(newxk);