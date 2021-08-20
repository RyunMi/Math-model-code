clc, clear
a = readmatrix('data7_25.txt');
X = a(:,[1:end-1]); Y = a(:,end);
md0 = fitlm(X,Y)                     %拟合全部变量回归模型
md1 = fitlm(X,Y,'y~1+x1+x2+x4')      %拟合x1,x2,x4回归模型
md2 = fitlm(X,Y,'y~1+x1+x2')         %拟合x1,x2回归模型
md = stepwiselm(X, Y, 'y~1+x1+x2+x3+x4') %一步求出模型
