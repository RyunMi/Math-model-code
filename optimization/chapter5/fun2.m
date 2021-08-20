function F=fun2(x)
%f=zeros(31,1);
F=0;
n=length(x);ff=0;t=(1:29)/29;
f(30)=x(1);
f(31)=x(2)-x(1)^2-1;
for i = 1:29
    for j = 2:n
        f(i)=f(i)+(j-1)*x(j)*t(i)^(j-2);
    end
    for k = 1:n
        ff=ff+x(k)*t(i)^(k-1);
    end
    f(i)=f(i)-ff^2-1;
    F=F+f(i)^2;
end
F=F+f(30)^2+f(31)^2;
end