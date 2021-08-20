x0=[0;0];
%[k,x,val]=sr1('fun2','gfun2',x0);
%[k,x,val]=bfgs('fun2','gfun2',x0);
[k,x,val]=dfp('fun2','gfun2',x0);