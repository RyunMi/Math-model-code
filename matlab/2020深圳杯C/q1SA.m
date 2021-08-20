clc, clear, close all
sj=xlsread('data.xlsx');
d1=sj(1,:);%出发地、目的地经纬度
sj=sj(2:end,:);
xy=[d1;sj;d1];
amount=size(xy,1);
sj=xy*pi/180; %角度化成弧度
dist_matrix=zeros(amount); %距离矩阵d初始化
for i=1:amount-1
    for j=i+1:amount
        dist_matrix(i,j)=6370*acos(cos(sj(i,1)-sj(j,1))*cos(sj(i,2))*...
            cos(sj(j,2))+sin(sj(i,2))*sin(sj(j,2)));
    end
end
dist_matrix=dist_matrix+dist_matrix';
sol_new=[];E_current=inf; %巡航路径及长度初始化
for j=1:1000  %蒙特卡洛求较好的初始解
    path0=[1 1+randperm(amount-2),amount]; temp=0;
    for i=1:amount-1
        temp=temp+dist_matrix(path0(i),path0(i+1));
    end
    if temp<E_current
        sol_new=path0; E_current=temp;
    end
end
aa=[];
count=0;
% sol_new是每次产生的新解；sol_current是当前解；sol_best是冷却中的最好解；
E_current = inf;E_best = inf; 
% E_current是当前解对应的回路距离；
% E_new是新解的回路距离；
% E_best是最优解的
sol_current = sol_new; sol_best = sol_new;
a = 0.99;% 温度衰减函数的参数
t0 = 100;%初始温度
tf = 0.1;%最低温
t = t0;
Markov_length = 10000;	% Markov链长度
pSwap=0.2;                          %选择交换结构的概率
pReversion=0.3;                     %选择逆转结构的概率
pInsertion=1-pSwap-pReversion;      %选择插入结构的概率
while t>=tf
    for r=1:Markov_length
        sol_new=Neighbor(sol_new,pSwap,pReversion,pInsertion);
        % 计算目标函数值
        E_new = 0;
        for i = 1 : (amount-1)
            E_new = E_new + ...
                dist_matrix(sol_new(i),sol_new(i+1));
        end
        % 再算上从最后一个城市到第一个城市的距离
        E_new = E_new + ...
            dist_matrix(sol_new(amount),sol_new(1));
        
        if E_new < E_current
            E_current = E_new;
            sol_current = sol_new;
            if E_new < E_best
                % 把冷却过程中最好的解保存下来
                E_best = E_new;
                sol_best = sol_new;
            end
        else
            % 若新解的目标函数值小于当前解的，
            % 则仅以一定概率接受新解
            if rand < exp(-(E_new-E_current)./t)
                E_current = E_new;
                sol_current = sol_new;
            else
                sol_new = sol_current;
            end
        end
    end
    t=t.*a;		% 控制参数t（温度）减少为原来的a倍
    aa=[aa;E_best];
    count=count+1;
end
disp('最优解为：')
disp(sol_best)
disp('最短距离：')
disp(E_best)
xx=xy(sol_best,1); yy=xy(sol_best,2);
plot(xx,yy,'-*') %画出巡航路径
plot(1:count,aa);