%clc,clear
%a=[1,0;1,1;3,2;4,3;2,5];
t=0
a={'euclidean','seuclidean','cityblock','minkowski','chebychev','mahalanobis','hamming'};
n=length(a);
b={'single','average','complete','ward','weighted'};
m=length(b);
A=Tscore;
for k=1:n
    for j=1:m
        Y=pdist(A,a{k});  %求a的两两行向量间的绝对值距离
%YC=squareform(Y);  %变换成距离方阵
        Z=linkage(Y,b{j});  %产生等级聚类树
        C=cophenet(Z,Y);%越接近1越好
        if max(C)>0.75
            t=1;
            break;
        end
    end
    if t==1
    break;
    end
end
dendrogram(Z) %画聚类图
T=cluster(Z,'maxclust',3)  %把对象划分成3类
for i=1:3
    tm=find(T==i);  %求第i类的对象
    tm=reshape(tm,1,length(tm)); %变成行向量
    fprintf('第%d类的有%s\n',i,int2str(tm)); %显示分类结果
end
