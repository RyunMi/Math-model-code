clc, clear
a=xlsread('Hu.xlsx','B2:G19');
a=a';
P=a(1:5,1:end-3); [PN,PS1]=mapminmax(P); 
T=a(6,1:end-3);  [TN,PS2]=mapminmax(T); 
net_1=newrb(PN,TN);   view(net_1)  
x=a(1:5,end-2:end); xn=mapminmax('apply',x,PS1);
yn1=sim(net_1,xn); y1=mapminmax('reverse',yn1,PS2)
delta1=abs(a(6,end-2:end)-y1)./a(6,end-2:end)
Hu=xlsread('Hu.xlsx','B19:F19')';
hect=ones(30,1);
for i=1:30
    Hu(3)=3000-(i-1)*50; 
    Huu=mapminmax('apply',Hu,PS1);
    Ww=sim(net_1,Huu);
    Wn=mapminmax('reverse',Ww,PS2);
    hect(i)=Wn(1);
end
%xlswrite('try.xlsx',hect(1:20))
plot(2018:2037,hect(1:20),'g')
xlabel('Years');ylabel('TE');
net2=feedforwardnet(2);
%net2=feedforwardnet(4);
net2=train(net2,PN,TN);
yn2=net2(xn);y2=mapminmax('reverse',yn2,PS2);