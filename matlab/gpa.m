A=xlsread('gpa.xlsx','D1:D39');
B=xlsread('gpa.xlsx','E1:E39');
G=0;P=0;
for i = 1:39
    G=G+A(i)*B(i);
end
for j = 1:39
    P=P+B(j);
end
GPA=G/P;E=GPA*0.9;
disp(E);
%接下来33.5学分全90，77.2836
%接下来33.5学分全100，79.3920