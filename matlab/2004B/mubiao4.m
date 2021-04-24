function f = mubiao4(x)
%此函数目的是找出调整后出力的报价并计算阻塞费用
x=x';
T=xlsread('problem3.2.xlsx','A1:J8');T=cumsum(T,2);%导入段容量矩阵并做累加
P=xlsread('problem3.1.xlsx','A1:J8');%导入段价矩阵
L=zeros(1,8);C=zeros(1,8);
%x0=[150,81,218.2,99.5,135,150,102.1,117]%问题五求出的初始出力分配方案
x0=[150,79,180,99.5,125,140,95,113.9];%问题三求出的初始出力分配方案
for i = 1:8
        a=(T(i,:)>=x(i));
    if sum(a)
        [~,k] = max(a,[],2);
        L(i)=k;
    end
end
for j = 1:8
    C(j)=P(j,L(j));
end
h=0;f=0;
for m = 1:8
    h=abs((C(m)-303)*(x(m)-x0(m)));
    f=f+h;
end
%f=f*0.25;
end