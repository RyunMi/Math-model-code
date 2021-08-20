a=xlsread('2016C.xlsx','A3:A1885');
b=xlsread('2016C.xlsx','B3:B1885');
c=xlsread('2016C.xlsx','C3:C1230');
d=xlsread('2016C.xlsx','D3:D865');
a1=a(1:1228);a2=a(1:863);
plot(a,b)
hold on
plot(a1,c)
hold on
plot(a2,d)
