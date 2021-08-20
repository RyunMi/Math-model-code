clc,clear
gj=load('data14_7.txt');
gj=zscore(gj); %数据标准化
r=corrcoef(gj);  %计算相关系数矩阵
%下面利用相关系数矩阵进行主成分分析，x的列为r的特征向量，即主成分的系数
[x,y,z]=pcacov(r) %y为r的特征值，z为各个主成分的贡献率
f=sign(sum(x));  %构造元素为±1的行向量
x=x.*f           %修改特征向量的正负号
num=3;  %num为选取的主成分的个数
df=gj*x(:,[1:num]);  %计算各个主成分的得分
tf=df*z(1:num)/100; %计算综合得分
[stf,ind]=sort(tf,'descend');  %把得分按照从高到低的次序排列
stf=stf', ind=ind'
