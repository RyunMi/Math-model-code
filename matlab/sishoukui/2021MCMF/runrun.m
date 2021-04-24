clc, clear
a=xlsread('Hu.xlsx','B2:G19');%load data
%a=load('jingliu.txt'); %把表中第2列到第6列的数据保存到纯文本文件jingliu.txt
a=a'; %注意神经网络的数据格式，不要把矩阵搞转置了。
P=a(1:5,1:end-3); [PN,PS1]=mapminmax(P); %自变量数据规格化到[-1,1]
T=a(6,1:end-3);  [TN,PS2]=mapminmax(T); %因变量数据规格化到[-1,1]
net1=newrb(PN,TN)  %训练RBF网络
x=a(1:5,end-2:end); xn=mapminmax('apply',x,PS1); %预测样本点自变量规格化
yn1=sim(net1,xn); y1=mapminmax('reverse',yn1,PS2) %求预测值，并把数据还原
delta1=abs(a(6,end-2:end)-y1)./a(6,end-2:end)
Hu=xlsread('Hu.xlsx','B19:F19')';
hect=ones(30,1);
for i=1:30
    Hu(3)=1500+(i-1)*50;
    Huu=mapminmax('apply',Hu,PS1);
    Ww=sim(net1,Huu);
    Wn=mapminmax('reverse',Ww,PS2);
    hect(i)=Wn(1);
end
plot(2018:1:2047,hect);