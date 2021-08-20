clc,clear;
x_al=[1,1,1];
N_inequ=1;
[X,FVAL]=AL_main(x_al,N_inequ);
disp('迭代结果为：')
disp(X);disp(FVAL);