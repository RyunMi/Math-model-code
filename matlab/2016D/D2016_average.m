clc,clear all;
rou=1.205;%����20�ȣ�һ������ѹ
%���ݵĶ�ȡ
for j=1:12
    filename=['./2015',num2str(j,'%02d'),'.xls'];
    [Type Sheet Format]=xlsfinfo(filename);%��ÿ����������Sheet������
    for i=1:length(Sheet)
        data=xlsread(filename,i,'C4:L27');
        wind_speed=data(:,1:3:10);%��ȡÿ��ÿʱ�̵ķ���
        wind_speed=wind_speed(:);%����ά����ת����һά����
        wind_speed=rmmissing(wind_speed);%ȥ��ÿ�����з��ؿ�ֵ������ 
        day_data(i)=mean(wind_speed);
        if length(Sheet)<31%������31��������µ�ʣ�������ƽ��������Ϊ0
            for k=length(Sheet)+1:31
                day_data(k)=0;
            end
        end
    end
    day_average(:,j)=day_data;%��������Ϊ���ڣ�������Ϊ�·ݵõ�һ��31*12����ƽ�����پ���
    month_average(j)=sum(day_average(:,j))/sum(sum(day_average(:,j)~=0));%�����ƽ������
end 
%��ÿ���¶�Ӧ��ƽ�������ܶ�
for month=1:12
    for day=1:31
        density(day,month)=rou.*(day_average(day,month))^3;
    end
    power_density(month)=sum(density(:,month))/(2*sum(sum(day_average(:,j)~=0)));
    power_densityear=sum(sum(density))/(2*365);%������ܶ�
end

disp('day_average=')
disp(day_average)
disp('month_average=')
disp(month_average)
year_average=mean(month_average)
disp('power_density')
disp(power_density)
disp('power_densityear')
disp(power_densityear)
        