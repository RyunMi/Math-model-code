clc,clear;
%Z=xlsread("Hu.xlsx",'B2:H22');
%    apha=0.09;
%    Z(19,1:5)=(1+apha).*Z(18,1:5);
%xlswrite('xyl.xlsx',Z(19,1:5),'B20:F20')
%    Z(20,1:5)=Z(19,1:5);
%xlswrite('xyl.xlsx',Z(20,1:5),'B21:F21')   
%    Z(21,1:5)=Z(20,1:5);
%xlswrite('xyl.xlsx',Z(21,1:5),'B22:F22')
%X=Z(:,2:3);
%Y=Z(:,4);
%b=Z(:,end-5:end);
%F_1=[-0.73,0.855,0.039,0.051,0.264,0.270];
%F_2=[1.034,-0.693,0.225,0.212,-0.023,-0.031];
%Y_1=b*F_1';
%Y_2=b*F_2';
%c=[0.583673469387755,0.462244897959184];
%    X=Z(:,1:5);
%    Y=Z(:,6:7);
%[W_1,Q_1,T_1,I_1]=deacco(X,Y);
%[Q_2,T_2,I_2]=bcc(X,Y);
%    [W_2,Q_3,T_3,I_3]=deasupers(X,Y);
%    Q_3

%a=Z(:,1);
%figure(1)
%plot(Q_1)%综合技术效率
%hold on;
%plot(Q_2)%纯技术效率
%hold on;
%plot(Q_3)%超效率
%hold on;
%Q_4=Q_1./Q_2;
%plot(Q_4)%规模效率
%title('efficent graph')
%legend('Comprehensive technical efficiency','Pure technical efficiency','Super efficiency','Scale efficiency')
%xlabel('year');ylabel('efficiency');
%Q=[Q_1',Q_2',Q_4',Q_3'];
%figure(2)
%subplot(2,2,1)
%plot(a,Q_1)
%subplot(2,2,2)
%plot(a,Q_2)
%subplot(2,2,3)
%plot(a,Q_3)
%subplot(2,2,4)
%plot(a,Q_4)
%xlswrite('test.xlsx',Q,'A115:D132')