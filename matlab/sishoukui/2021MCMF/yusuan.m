clc,clear;
theta=[0.533744,0.513134,0.519092];
a2=-1.209e+9;b=-0.7814 ; c=2.652e+8;
y2=a2.*theta.^b+c;
p1=-3.251e+8;p2=6.41e+8;p3=5.921e+9;
y1=p1.*theta.^2+p2.*theta+p3;
y=[y1',y2'];
xlswrite('Hu.xlsx',y,'G20:H22');
a_3=2127;b_3=-1.067;
y3=a_3.*Hu.^b_3;
xx=1000:100:3000
yy=a_3.*xx.^b_3
plot(xx,yy)