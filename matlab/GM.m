function f=GM(x0,y)%��������x0Ϊ���������ݣ�y0Ϊ���Ԥ������
x0=x0';
n=length(x0);
lamda=x0(1:n-1)./x0(2:n);%���㼶��
x1=cumsum(x0);
B=[-0.5*(x1(1:n-1)+x1(2:n)),ones(n-1,1)];
Y=x0(2:n);
u=B\Y;
syms x(t)
x=dsolve(diff(x)+u(1)*x==u(2),x(0)==x0(1));
yuce=subs(x,t,[0:n-1+y]);
yuce=double(yuce);
f=[x0(1),diff(yuce)];%Ԥ��ֵ
m=[1:n];
plot(m,x0)%��ԭ����ͼ
hold on
w=[1:n+y];
scatter(w,f)%��Ԥ������ɢ��ͼ
epsilon=x0'-f(1:n);
delta=abs(epsilon./x0')%������
rho=1-(1-0.5*u(1))/(1+0.5*u(1))*lamda'%����ƫ��ֵ

