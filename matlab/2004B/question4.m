clc,clear;
xx=xlsread('question3.xlsx','A19:H19');%导入方案0的出力
v=xlsread('question3.xlsx','A20:H20');%导入爬坡速率
T1=xx+15.*v;T2=xx-15.*v;%T1为出力上限，T2为出力下限
A=xlsread('result.xlsx','B2:I7');%导入潮流关于出力方程的系数
e=xlsread('question3.xlsx','A22:F22')';%导入潮流限值
a0=xlsread('result.xlsx','A2:A7');%导入潮流关于出力方程的常数项系数
A=[A;-A]; b=[e-a0;e+a0];
Aeq=[1,1,1,1,1,1,1,1];beq=982.4;
lb=T2';ub=T1';
xy=[130,60,195,85,115,138,88,115]';%将初值设置为各机组段容量表中平均值
[x,fval,exitflag]=fmincon('mubiao4',xy,A,b,Aeq,beq,lb,ub,[]);
disp(x);disp(fval);disp(exxitflag);