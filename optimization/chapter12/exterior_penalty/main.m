function main()
    clc;clear;
    x_al=[2,2,2];
    N_equ=1;
    N_inequ=6;
    [X,FVAL]=AL_main(x_al,N_equ,N_inequ);
    disp('迭代结果为：')
    disp(X);disp(FVAL);
end