A=zeros(100);
A(1,1:2)=[4,-1];
A(100,99:100)=[-1,4];
xx=[-1,4,-1];
for i = 2:99
    A(i,i-1:i+1)=xx;
end
B=2.*ones(100,1);
B(1)=3;B(100)=3;
x0=zeros(100,1);
epsilon=1e-5;
N=20;
[k,x,val]=linecg(A,B,x0,epsilon,N);
disp('k=');disp(k);disp('val='),disp(val);