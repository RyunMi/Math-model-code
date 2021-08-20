%计算风速的频数
clc,clear all;
%数据的读取
for j=1:12
    filename=['./2015',num2str(j,'%02d'),'.xls'];
    [Type Sheet Format]=xlsfinfo(filename);%得每个表中所含Sheet的数量
    for i=1:length(Sheet)
        data=xlsread(filename,i,'C4:L27');
        clock_speed=data(4:4:24,1:3:10);
        clock_speed=reshape(clock_speed,1,24);
        speed_month(:,i)=clock_speed;
        if length(Sheet)<31
                for k=length(Sheet)+1:31
                    speed_month(:,k)=0;
                end
        end
    end
    total(j,:)=speed_month(:)';
end
max(total(:)');%确定最大的风速为23.1
friquence=zeros(1,24);%设置一个空的一维数组用来存储结果
for number=1:24
    for z=1:8928
        if total(z)<=number&&total(z)>number-1
            friquence(number)=friquence(number)+1;
        end
    end
end
total
friquence