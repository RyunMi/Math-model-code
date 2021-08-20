clc,clear
%a=textread('hua.txt');
a=xlsread('yuce.xlsx');
a=a(:,2);
a=nonzeros(a'); %����ԭ�����ݵ�˳��ȥ����Ԫ��
r11=autocorr(a)   %��������غ���
r12=parcorr(a)   %����ƫ��غ���
da=diff(a);      %����1�ײ��
r21=autocorr(da)  %��������غ���
r22=parcorr(da)   %����ƫ��غ���
n=length(a);  %�����ֺ�����ݸ���
dda=diff(da);
k=0; %��ʼ����̽ģ�͵ĸ���
for i=0:3
    for j=0:3
        if i==0 & j==0
            continue
        elseif i==0
            ToEstMd=arima('MALags',1:j,'Constant',0); %ָ��ģ�͵Ľṹ
        elseif j==0
            ToEstMd=arima('ARLags',1:i,'Constant',0); %ָ��ģ�͵Ľṹ
        else
            ToEstMd=arima('ARLags',1:i,'MALags',1:j,'Constant',0); %ָ��ģ�͵Ľṹ
        end
        k=k+1; R(k)=i; M(k)=j;
        [EstMd,EstParamCov,logL,info]=estimate(ToEstMd,da); %ģ�����
        numParams = sum(any(EstParamCov)); %������ϲ����ĸ���
        %compute Akaike and Bayesian Information Criteria
        [aic(k),bic(k)]=aicbic(logL,numParams,n);
    end
end
fprintf('R,M,AIC,BIC�Ķ�Ӧֵ����\n %f');  %��ʾ������
check=[R',M',aic',bic']%ȡaic bic��С��
r=input('�������R��');m=input('�������M��');
ToEstMd=arima('ARLags',1:r,'MALags',1:m,'Constant',0); %ָ��ģ�͵Ľṹ
[EstMd,EstParamCov,logL,info]=estimate(ToEstMd,da); %ģ�����
dx_Forecast=forecast(EstMd,12,'Y0',da)  %����10��Ԥ��ֵ
x_Forecast=a(end)+cumsum(dx_Forecast)   %����ԭʼ���ݵ�10��Ԥ��ֵ
res=infer(EstMd,a);%����в�
h=lbqtest(res)%����ģ�ͼ���