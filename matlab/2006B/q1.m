clc,clear
x=zeros(194,5);
y=zeros(194,5);
yy=zeros(194,5);
x0=zeros(194,1);
y0=zeros(194,1);
p=zeros(194,3);
maxx=zeros(194,1);
A=xlsread('network.xlsx','sheet1','A3:A972');
B=xlsread('network.xlsx','sheet1','G3:G972');
C=xlsread('network.xlsx','sheet1','C3:C972');
A=[A,C,B];
%f=@(t) -0.031946297440953*t.^2+0.859866657983743*t+37.522033680024080;
%t=0:45;
%plot(t,f(t));
%hold on;
for i = 1:194
    x(i,:)=A(A(:,1)==i,2)';
    y(i,:)=A(A(:,1)==i,3)';
    p(i,:)=polyfit(x(i,:),y(i,:),2);
    f=@(t) -(p(i,1)*t.^2+p(i,2)*t+p(i,3));
    [xx,fval]=fminbnd(f,0,50);
    maxx(i,:)=-fval;
    yy(i,:)=polyval(p(i,:),x(i,:));
    x0(i,:)=xx;
    y0(i,:)=y(i,1);
    plot(x(i,:),yy(i,:));
    hold on;
end
work=[y0,x0,maxx];
a=work(:,1:2);
%a=xlsread('delete','A2:B162');
a=a';
P=a(1,[1:end-1]); [PN,PS1]=mapminmax(P);
T=a(2,[1:end-1]);  [TN,PS2]=mapminmax(T); 
net1=newrb(PN,TN);  
x1=a(1,end); xn=mapminmax('apply',x1,PS1); 
yn1=sim(net1,xn); y1=mapminmax('reverse',yn1,PS2); 
delta1=abs(a(2,end)-y1)/a(2,end)  
x2=0:0.005:70;x2=x2';xxn=mapminmax('apply',x2,PS1);
yn2=sim(net1,xxn');y2=mapminmax('reverse',yn2,PS2);
plot(x2,y2');
hold on;
net2=feedforwardnet(5);  
net2 = train(net2,PN,TN); 
yn3= net2(xn); y3=mapminmax('reverse',yn3,PS2);
delta2=abs(a(2,end)-y3)/a(2,end);
yn4=sim(net2,xxn');y4=mapminmax('reverse',yn4,PS2);
%plot(x2,y4);