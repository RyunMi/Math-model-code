clc,clear, close all
sj=xlsread('data.xlsx');
d1=sj(1,1:2);%出发地、目的地经纬度
sj=sj(2:end,1:2);
xy=[d1;sj;d1]; sj=xy*pi/180;  %单位化成弧度
amount=size(xy,1);
d=zeros(amount); %距离矩阵d的初始值
aa=[];
for i=1:amount-1
    for j=i+1:amount
        d(i,j)=6370*acos(cos(sj(i,1)-sj(j,1))*cos(sj(i,2))*...
            cos(sj(j,2))+sin(sj(i,2))*sin(sj(j,2)));
    end
end
d=d+d'; w=50; g=amount-2; %w为种群的个数，g为进化的代数
for k=1:w  %通过改良圈算法选取初始种群
    c=randperm(amount-2); %产生1，...，amount-2的一个全排列  
    c1=[1,c+1,amount]; %生成初始解
    for t=1:amount %该层循环是修改圈 
        flag=0; %修改圈退出标志
        for m=1:amount-2
            for n=m+2:amount-1
                if d(c1(m),c1(n))+d(c1(m+1),c1(n+1))<...
                        d(c1(m),c1(m+1))+d(c1(n),c1(n+1))
                    c1(m+1:n)=c1(n:-1:m+1);  flag=1; %修改圈
                end
            end
        end
        if flag==0
            J(k,c1)=1:amount; break %记录下较好的一组解并退出当前层循环
        end
    end
end
J(:,1)=0; J=J/amount; %把整数序列转换成[0,1]区间上实数即染色体编码
for k=1:g  %该层循环进行遗传算法的操作 
    A=J; %交配产生子代A的初始染色体
    c=randperm(w); %产生下面交叉操作的染色体对 
    for i=1:2:w  
        F=2+floor(amount-2*rand(1)); %产生交叉操作的地址
        temp=A(c(i),[F:amount]); %中间变量的保存值
        A(c(i),[F:amount])=A(c(i+1),[F:amount]); %交叉操作
        A(c(i+1),F:amount)=temp;  
    end
    by=[];  %为了防止下面产生空地址，这里先初始化
    while ~~isempty(by)
        by=find(rand(1,w)<0.1); %产生变异操作的地址
    end
    B=A(by,:); %产生变异操作的初始染色体
    for j=1:length(by)
        bw=sort(2+floor((amount-2)*rand(1,3)));  %产生变异操作的3个地址
        %交换位置
        B(j,:)=B(j,[1:bw(1)-1,bw(2)+1:bw(3),bw(1):bw(2),bw(3)+1:amount]); 
    end
    G=[J;A;B]; %父代和子代种群合在一起
    [SG,ind1]=sort(G,2); %把染色体翻译成1，...,amount的序列ind1
    num=size(G,1); long=zeros(1,num); %路径长度的初始值
    for j=1:num
        for i=1:amount-1
            long(j)=long(j)+d(ind1(j,i),ind1(j,i+1)); %计算每条路径长度
        end
    end
    [slong,ind2]=sort(long); %对路径长度按照从小到大排序
    J=G(ind2(1:w),:); %精选前w个较短的路径对应的染色体
    for m=1:floor(num*0.3)
        [sn,en]=SA(G(ind2(m),:));
        if en<slong(m)
            J(m)=sn;
        end
    end
    aa=[aa;mean(slong(ind2(1:w)))];
end
path=ind1(ind2(1),:), flong=slong(1)  %解的路径及路径长度
xx=xy(path,1);yy=xy(path,2);
plot(xx,yy,'-o') %画出路径