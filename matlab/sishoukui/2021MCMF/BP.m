%%
clear
clc
%%
%添加数据集
% load concrete_data
a=xlsread('Hu.xlsx','B2:H19');
%a=load('jingliu.txt'); %把表中第2列到第6列的数据保存到纯文本文件jingliu.txt
a=a'; %注意神经网络的数据格式，不要把矩阵搞转置了。
attributes=a(1:5,:);strength=a(6:7,:);
 %%  划分数据集
 temp = randperm(size(attributes,2));

 P_train = attributes(: , temp(1:17) );
 T_train = strength(: , temp(1:17) );
 P_test = attributes(: , temp(18:end) );
 T_test = strength(: , temp(18:end) );
 
 %% 数据归一化
 [p_train , ps_train ] = mapminmax(P_train,0,1);
 p_test = mapminmax('apply',P_test,ps_train);
 
[ t_train , ps_output ] = mapminmax(T_train , 0,1);

%% 开始构建BP网络
net = newff(p_train,t_train,9);   %隐含层为9个神经元
%设定参数网络参数
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-3;
net.trainParam.lr = 0.01;

%% 开始训练
net = train(net,p_train,t_train);

%% 测试网络
t_sim = sim(net,p_test);
%反归一化
T_sim = mapminmax('reverse',t_sim,ps_output);
R2 = corrcoef(T_sim,T_test);
R2 = R2(1,2)^ 2;
%% 画出误差图
figure
plot( 1:1, T_test, '-or' ,1:1 , T_sim , '-*b');
legend('真实值','预测值')
xlabel('预测样本')
ylabel('strength')
string = {'BP网络预测结果对比';['R^2=' num2str(R2)]};
title(string)
