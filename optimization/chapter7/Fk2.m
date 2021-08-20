function F=Fk2(x)
n=length(x);F=zeros(n,1);
for i =1:n
    if ~mod(i,2)
        F(i)=1-x(i-1);
    elseif mod(i,2)
        F(i)=10*(x(i+1)-x(i)^2);
    end
end
end