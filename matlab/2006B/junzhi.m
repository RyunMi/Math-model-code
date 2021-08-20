clc,clear;
a=xlsread('initial.xlsx','C3:C358');
b=xlsread('initial.xlsx','A3:A358');
[Idx,C]=kmeans(a,3);
n=size(a,1);
CD1=zeros(1,356);CD2=zeros(1,356);CD3=zeros(1,356);
for i =1:n
    if Idx(i)==1
        CD1(i)=b(i);
    elseif Idx(i)==2
        CD2(i)=b(i);
    elseif Idx(i)==3
        CD3(i)=b(i);
    end
end
CD1=nonzeros(CD1);CD2=nonzeros(CD2);CD3=nonzeros(CD3);
n1=size(CD1,1);n2=size(CD2,1);n3=size(CD3,1);
re1=zeros(1,n1);re2=zeros(1,n2);e3=zeros(1,n3);
for j =1:n1
    re1(j)=a(find(b==CD1(j)));
end
for k =1:n2
    re2(k)=a(find(b==CD2(k)));
end
for l=1:n3
    re3(l)=a(find(b==CD3(l)));
end
max1=max(re1);min1=min(re1);
max2=max(re2);min2=min(re2);
max3=max(re3);min3=min(re3);
A=xlsread('data1.xlsx','A3:C1667');
x1=[];x2=[];x3=[];y1=[];y2=[];y3=[];
for o=1:n1
    x1=[x1,A(find(A(:,1)==CD1(o)),2)'];
    y1=[y1,A(find(A(:,1)==CD1(o)),3)'];
end
for p=1:n2
    x2=[x2,A(find(A(:,1)==CD2(p)),2)'];
    y2=[y2,A(find(A(:,1)==CD2(p)),3)'];
end
for q=1:n3
    x3=[x3,A(find(A(:,1)==CD3(q)),2)'];
    y3=[y3,A(find(A(:,1)==CD3(q)),3)'];
end
%pf1=polyfit(x1,y1,2);pf2=polyfit(x2,y2,2);pf3=polyfit(x3,y3,2);
%[xv,ind]=sort(x1);xv=xv';yv=y(ind);
%plot(xv, yv, '+', 'LineWidth', 3, 'MarkerSize', 12);
%xv = xv + 0.000001 * rand(length(xv), 1);
%coefficients = polyfit(xv, yv, 2);
%yFit = polyval(coefficients, xv);
%hold on
%plot(xv, yFit, 'r-', 'LineWidth', 3);
%grid on;
%xlabel('x', 'FontSize', 20);
%ylabel('y', 'FontSize', 20);
%legend('data', 'fit');