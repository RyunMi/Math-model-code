clc
clear
t=input('请输入总出力值(负荷需求)：');
start=xlsread('problem3.xlsx','B2:I8'); %导入各机组处理方案表格
speed=[2.2 1 3.2 1.3 1.8 2 1.4 1.8]; %爬坡速率
c=[];
for i=1:size(speed,2)
    c=[c,start(1,i)+15*speed(1,i)];  %计算15分钟后各机组的最大出力值
end
x=xlsread('problem3.2.xlsx','A1:J8'); %导入段容量表格
a=[];
for i=1:size(x,1) %size(x,1)返回x的行数，行遍历
    sum=0;
    for j=1:size(x,2) %size(x,2)返回x的列数，列遍历
    sum=sum+x(i,j);
    if sum>c(1,i)
        break;
    end       %单个机组段容量累加，若超过最大出力值跳出循环，转到下一机组
    end
    a=[a,j]; %得到各机组段容量的范围，1行8列
end
y=xlsread('problem3.1.xlsx','A1:J8');  %导入段价表格
true=0;
while(true==0)
    max=0;
    for i=1:8   %各机组进行遍历
        for j=1:a(1,i)  %各机组可取的段容量范围遍历
            if y(i,j)>max  
                max=y(i,j); %选取到新的段价最大值
                s1=i;     
                s2=j;    %找到最大值以及其所在的行和列
            end
        end
    end
    sum=0;  %初始化
    for i=1:8
        if (s1==i) 
            for j=1:s2    %若含有价格最高行，取到清算价为止
                sum=sum+x(i,j);
            end
        else
            for j=1:a(1,i) %其余机组，选到该机组最大出力为止
                sum=sum+x(i,j);
            end
        end
    end        %记录此时最大出力和与最大负荷比较
    if sum>=t  %此时最大出力大于最大负荷值
        if sum ~= t
        answer=max;   %记录下当前的最大值
        else
        answer=0;
        end
        a(1,s1)=s2-1;  
        s3=s1;    
        s4=s2;    %记下最大值所在的行与列
    else
        true=1;
    end
end
%answer即为最终得到的清算值
disp(['清算价格为:',num2str(answer)]);