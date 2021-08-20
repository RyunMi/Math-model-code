clc,clear
%randn('state',sum(clock));  %初始化随机数发生器
%elps=randn(1,10000);   %产生10000个服从标准正态分布的随机数
%x(1)=0;   %赋初始值
%for j=2:10000
%    x(j)=0.8*x(j-1)+elps(j)-0.4*elps(j-1); %产生样本点
%end
a=xlsread('yuce.xlsx');
x=a(:,2);
figure(1);
autocorr(x)   %计算自相关函数
figure(2);
parcorr(x)   %计算偏相关函数
t_1=a(:,1);
t_2=max(t_1):max(t_1)-1+15;
t_2=t_2';%预测时间
t=[t_1;t_2];
%x=x'; %转换成下面需要的列向量
for i=0:4
    for j=0:4
        if i==0 && j==0
            continue  %arma(p,q)模型中，p,q不能同时为0
        end
    m=armax(x,[i,j]);  %拟合模型，已知数据必须是列向量
    myaic=aic(m); %计算AIC指标
    fprintf('p=%d,q=%d,AIC=%f\n',i,j,myaic);  %显示计算结果
    end
end
p=input('输入阶数p＝');q=input('输入阶数q＝'); %输入模型的阶数
m=armax(x,[p,q])%拟合指定参数p,q的模型
xp=predict(m,x);
xhat=forecast(m,x,15);
yuce=[xp;xhat];
figure(3);
plot(t_1,x)
hold on
plot(t,yuce)
res=x-xp;
h=lbqtest(res) %进行chi2检验
xlswrite('test.xlsx',x,'A1:A18');
xlswrite('test.xlsx',yuce,'B1:B33');