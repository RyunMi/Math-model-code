clc, clear
ab=xlsread('question1.xlsx'); 
xi=ab(:,2:9); %提取x1至x8的观察值
X=[ones(32,1),xi]; %构造多元线性回归分析的数据矩阵X
result=zeros(6,9);
R2=zeros(6,1);
for i=1:6
    y=ab(:,[9+i]); %提取因变量y的观察值
    Y=nonzeros(y); %去掉y后面的0，并变成列向量
    [beta,betaint,r,rint,st]=regress(Y,X);  %计算回归系数和统计量等
    result(i,:)=beta';%输出系数矩阵
    R2(i)=st(1);
end 
xlswrite('result.xlsx',result)
xlswrite('result.xlsx',R2,'J1:J6')