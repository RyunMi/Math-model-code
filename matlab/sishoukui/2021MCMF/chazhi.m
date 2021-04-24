clc,clear;
a=xlsread('xyl.xlsx','Q2:R18');
x=xlsread('xyl.xlsx','A2:A19');
y=xlsread('xyl.xlsx','G2:H19');
y1=y(:,1);y2=y(:,2);
x0=a(:,1);y0=a(:,2);
theta=interp1(x0,y0,2001,'linear')
theta=[y0(1);theta(1);y0(2:end,:)];
%a2=-1.209e+9;b=-0.7813 ; c=2.65e+8;
%Z2=a.*y.^b+c;
%plot(y,Z);
%figure(1)
%plot(x,theta);
%figure(2)
%plot(x,y);
%n=5;
%mu = [mean(y); std(y)];
%y1 = (y - mu(1))/mu(2);   % 手动实现 centering and scaling
%p1 = polyfit(y1,theta,3);
%pv=polyval(p1,y1);
%plot(y,pv,'r-')