clc,clear
a=xlsread('data.xlsx','A1:Q6');
p=zeros(6,17);
max=max(a,[],2);
for i =1:6
    p(i,:)=a(i,:)/max(i);
end
x=zeros(1,17);
for j=1:17
   x(j)=log(j); 
end