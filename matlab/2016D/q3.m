clc,clear,prob=optimproblem;
P=xlsread('./day_power.xls');
P=P(:);P(P==0)=[];%P=repmat(P,1,124);P=roundn(P,0);
x=optimvar('x',124,365,'Type','integer','LowerBound',0,'UpperBound',1);
y=optimvar('y',4,365,'Type','integer','LowerBound',0,'UpperBound',1);
z=optimvar('z',4,365,'Type','integer','LowerBound',0,'UpperBound',1);
for j=1:365
    for i=1:124
        prob.Objective=sum(sum(x(:,j))*P(j));
    end
end
%prob.Objective=sum(eig(P*x));
prob.Constraints.con1=sum(x,2)==4;
prob.Constraints.con2=sum(y,1)<=3;
prob.Constraints.con3=sum(z,1)==1;
%prob.Constraints.con4=sum(y,2)==62;
con5=[];
for k=1:4
    for j=1:365
        con5=[con5;y(k,j)+z(k,j)<=1];
    end
end
prob.Constraints.con5=con5;
prob.Constraints.con6=sum(x,1)-sum(y,1)==0;
con7=[];
for i=1:124
    for t=1:95
        con7=[con7;sum(x(i,t:t+270))>=1];
    end
end
prob.Constraints.con7=con7;
con8=[];
for i=1:124
    for m=2:364
        con8=[con8;x(i,m-1)-x(i,m)+x(i,m+1)>=0];
    end
end
con9=[];
for i=1:4
    for n=1:359
        con9=[con9;sum(y(i,n:n+6))+sum(z(i,n:n+6))<=6];
    end
end
prob.Constraints.con8=con8;
prob.Constraints.con9=con9;
[sol,fval,flag]=solve(prob)