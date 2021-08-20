n=2;t=zeros(n,1);h=1/(n+1);
for m = 1:n
   t(m)=m*h;
end
for i = 1:n
    x0(i)=t(i)*(t(i)-1);
end
[k,x,val]=sr1('fun3','gfun3',x0);
%[k,x,val]=bfgs('fun3','gfun3',x0);
%[k,x,val]=dfp('fun3','gfun3',x0);