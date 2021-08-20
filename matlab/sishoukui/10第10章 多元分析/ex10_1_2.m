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
        Y=pdist(A,a{k});  %��a��������������ľ���ֵ����
%YC=squareform(Y);  %�任�ɾ��뷽��
        Z=linkage(Y,b{j});  %�����ȼ�������
        C=cophenet(Z,Y);%Խ�ӽ�1Խ��
        if max(C)>0.75
            t=1;
            break;
        end
    end
    if t==1
    break;
    end
end
dendrogram(Z) %������ͼ
T=cluster(Z,'maxclust',3)  %�Ѷ��󻮷ֳ�3��
for i=1:3
    tm=find(T==i);  %���i��Ķ���
    tm=reshape(tm,1,length(tm)); %���������
    fprintf('��%d�����%s\n',i,int2str(tm)); %��ʾ������
end
