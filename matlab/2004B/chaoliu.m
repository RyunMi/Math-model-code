clc,clear;
%计算潮流值
A=xlsread('result.xlsx','A2:I7');
x0=[1,153,87.9971,228,99.5,152,113.2152,102.0877,117]';
L=zeros(1,6);
for i =1:6
    L(i)=A(i,:)*x0;
end
disp(L);