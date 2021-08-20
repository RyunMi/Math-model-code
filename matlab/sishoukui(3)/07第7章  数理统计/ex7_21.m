clc, clear, close all
a=readmatrix('data7_21.txt')'  %注意矩阵转置,和7_20有所不同
[p,t,st]=anova2(a,2)%2表示重复2次的数据