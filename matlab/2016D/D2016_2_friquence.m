clc,clear all;
year=[];
for j=1:12
    filename=['./',num2str(j,'%02d'),'.xls'];
    [Type,Sheet]=xlsfinfo(filename);%得每个表中所含Sheet的数量
    for i=1:length(Sheet)
        data=xlsread(filename,i,'C4:N9');
        year=[year,data];
    end
end
%数据处理
vi=[];
for k = 1:365
    vv=mean(year(:,12*k),2);
    vi=[vi,vv];
end
maxx=max(vi,[],2);minn=min(vi,[],2);
pp=zeros(6,17);
for p=1:6
    for q=1:356
        for num=1:17
            if vi(p,q)>=num-1 && vi(p,q)<num
                pp(p,num:end)=pp(p,num:end)+ones(1,18-num);
            end
        end
    end
end
        
