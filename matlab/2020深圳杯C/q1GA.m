clc,clear, close all
sj=xlsread('data.xlsx');
d1=sj(1,1:2);%�����ء�Ŀ�ĵؾ�γ��
sj=sj(2:end,1:2);
xy=[d1;sj;d1]; sj=xy*pi/180;  %��λ���ɻ���
amount=size(xy,1);
d=zeros(amount); %�������d�ĳ�ʼֵ
aa=[];
for i=1:amount-1
    for j=i+1:amount
        d(i,j)=6370*acos(cos(sj(i,1)-sj(j,1))*cos(sj(i,2))*...
            cos(sj(j,2))+sin(sj(i,2))*sin(sj(j,2)));
    end
end
d=d+d'; w=50; g=amount-2; %wΪ��Ⱥ�ĸ�����gΪ�����Ĵ���
for k=1:w  %ͨ������Ȧ�㷨ѡȡ��ʼ��Ⱥ
    c=randperm(amount-2); %����1��...��amount-2��һ��ȫ����  
    c1=[1,c+1,amount]; %���ɳ�ʼ��
    for t=1:amount %�ò�ѭ�����޸�Ȧ 
        flag=0; %�޸�Ȧ�˳���־
        for m=1:amount-2
            for n=m+2:amount-1
                if d(c1(m),c1(n))+d(c1(m+1),c1(n+1))<...
                        d(c1(m),c1(m+1))+d(c1(n),c1(n+1))
                    c1(m+1:n)=c1(n:-1:m+1);  flag=1; %�޸�Ȧ
                end
            end
        end
        if flag==0
            J(k,c1)=1:amount; break %��¼�½Ϻõ�һ��Ⲣ�˳���ǰ��ѭ��
        end
    end
end
J(:,1)=0; J=J/amount; %����������ת����[0,1]������ʵ����Ⱦɫ�����
for k=1:g  %�ò�ѭ�������Ŵ��㷨�Ĳ��� 
    A=J; %��������Ӵ�A�ĳ�ʼȾɫ��
    c=randperm(w); %�������潻�������Ⱦɫ��� 
    for i=1:2:w  
        F=2+floor(amount-2*rand(1)); %������������ĵ�ַ
        temp=A(c(i),[F:amount]); %�м�����ı���ֵ
        A(c(i),[F:amount])=A(c(i+1),[F:amount]); %�������
        A(c(i+1),F:amount)=temp;  
    end
    by=[];  %Ϊ�˷�ֹ��������յ�ַ�������ȳ�ʼ��
    while ~~isempty(by)
        by=find(rand(1,w)<0.1); %������������ĵ�ַ
    end
    B=A(by,:); %������������ĳ�ʼȾɫ��
    for j=1:length(by)
        bw=sort(2+floor((amount-2)*rand(1,3)));  %�������������3����ַ
        %����λ��
        B(j,:)=B(j,[1:bw(1)-1,bw(2)+1:bw(3),bw(1):bw(2),bw(3)+1:amount]); 
    end
    G=[J;A;B]; %�������Ӵ���Ⱥ����һ��
    [SG,ind1]=sort(G,2); %��Ⱦɫ�巭���1��...,amount������ind1
    num=size(G,1); long=zeros(1,num); %·�����ȵĳ�ʼֵ
    for j=1:num
        for i=1:amount-1
            long(j)=long(j)+d(ind1(j,i),ind1(j,i+1)); %����ÿ��·������
        end
    end
    [slong,ind2]=sort(long); %��·�����Ȱ��մ�С��������
    J=G(ind2(1:w),:); %��ѡǰw���϶̵�·����Ӧ��Ⱦɫ��
    for m=1:floor(num*0.3)
        [sn,en]=SA(G(ind2(m),:));
        if en<slong(m)
            J(m)=sn;
        end
    end
    aa=[aa;mean(slong(ind2(1:w)))];
end
path=ind1(ind2(1),:), flong=slong(1)  %���·����·������
xx=xy(path,1);yy=xy(path,2);
plot(xx,yy,'-o') %����·��