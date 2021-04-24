clc,clear;
Z=xlsread('Mexico.xlsx');
X=Z(:,2:6);b=Z(:,end-5:end);
F_1=[-0.73,0.855,0.039,0.051,0.264,0.270];
F_2=[1.034,-0.693,0.225,0.212,-0.023,-0.031];
Y_1=b*F_1';
Y_2=b*F_2';
Y=[Y_1,Y_2];
[W_1,Q_1,T_1,I_1]=deacco(X,Y);
[W_2,Q_3,T_3,I_3]=deasupers(X,Y);
Q_1=Q_1';Q_3=Q_3';
i=find(Q_3==0);
j_1=Z(1:i-1,1);j_2=Z(i+1:end,1);
j=[j_1;j_2];
Q=[Q_3(1:i-1,:);Q_3(i+1:end,:)];
theta=interp1(j,Q,Z(i+1,1),'linear')
theta=[Q(1:i-1,:);theta;Q(i+1:end,:)];
    