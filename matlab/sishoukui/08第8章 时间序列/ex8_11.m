clc,clear
%randn('state',sum(clock));  %��ʼ�������������
%elps=randn(1,10000);   %����10000�����ӱ�׼��̬�ֲ��������
%x(1)=0;   %����ʼֵ
%for j=2:10000
%    x(j)=0.8*x(j-1)+elps(j)-0.4*elps(j-1); %����������
%end
a=xlsread('yuce.xlsx');
x=a(:,2);
figure(1);
autocorr(x)   %��������غ���
figure(2);
parcorr(x)   %����ƫ��غ���
t_1=a(:,1);
t_2=max(t_1):max(t_1)-1+15;
t_2=t_2';%Ԥ��ʱ��
t=[t_1;t_2];
%x=x'; %ת����������Ҫ��������
for i=0:4
    for j=0:4
        if i==0 && j==0
            continue  %arma(p,q)ģ���У�p,q����ͬʱΪ0
        end
    m=armax(x,[i,j]);  %���ģ�ͣ���֪���ݱ�����������
    myaic=aic(m); %����AICָ��
    fprintf('p=%d,q=%d,AIC=%f\n',i,j,myaic);  %��ʾ������
    end
end
p=input('�������p��');q=input('�������q��'); %����ģ�͵Ľ���
m=armax(x,[p,q])%���ָ������p,q��ģ��
xp=predict(m,x);
xhat=forecast(m,x,15);
yuce=[xp;xhat];
figure(3);
plot(t_1,x)
hold on
plot(t,yuce)
res=x-xp;
h=lbqtest(res) %����chi2����
xlswrite('test.xlsx',x,'A1:A18');
xlswrite('test.xlsx',yuce,'B1:B33');