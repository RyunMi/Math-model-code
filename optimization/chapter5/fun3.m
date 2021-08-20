function F=fun3(x)
n=length(x);
t=zeros(n,1);
h=1/(n+1);F=0;
for m = 1:n
   t(m)=m*h;
end
for i = 1:n
    for j = 1:n
        if j == 1 
            f(j)=2*x(j)-x(j+1)+h^2*(x(j)+t(j)+1)^3/2;
        elseif j == n
            f(j)=2*x(j)-x(j-1)+h^2*(x(j)+t(j)+1)^3/2;
        else
        f(j)=2*x(j)-x(j-1)-x(j+1)+h^2*(x(j)+t(j)+1)^3/2;
        end
    end
    F=F+f(i)^2;
end
end