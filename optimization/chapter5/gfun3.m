function gf=gfun3(x)
n=length(x);
y=sym('x',[1,n]);
%gf=vpa(zeros(n,1));
for i=1:n
    syms (['x',num2str(i)]);    
end
for j = 1:n
    gf(j)=diff(fun3(y),y(j));
end
for k = 1:n
    for m = 1:n
        gf(k)=subs(gf(k),x(m));
    end
end
gf=gf';
end