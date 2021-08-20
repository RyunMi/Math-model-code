clc,clear all;
%数据的读取
for j=1:12
    filename=['./2015',num2str(j,'%02d'),'.xls'];
    [Type Sheet Format]=xlsfinfo(filename);%得每个表中所含Sheet的数量
    for i=1:length(Sheet)
        data=xlsread(filename,i,'C4:L27');
        wind_speed=data(:,1:3:10);%提取每天每时刻的风速
        wind_speed=wind_speed(:);%将二维数组转化成一维数组
        wind_speed=rmmissing(wind_speed);%去除每个表中返回空值的数据
        day_data(i)=mean(wind_speed);
        if length(Sheet)<31%将不足31天的其他月的剩余天的日平均风速设为0
            for k=length(Sheet)+1:31
                day_data(k)=0;
            end
        end
    end
    day_average(:,j)=day_data;%把行数设为日期，列数设为月份得到一个31*12的日平均风速矩阵
    month_average(j)=sum(day_average(:,j))/sum(sum(day_average(:,j)~=0));%求得月平均风速
end 
disp('day_average=')
disp(day_average)
disp('month_average=')
disp(month_average)
year_average=mean(month_average)