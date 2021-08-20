function x=x0(n)
x=zeros(n,1);
for i = 1:n
    if mod(i,2)
        x(i)=-1.2;
    elseif ~mod(i,2)
        x(i)=1;
    end
end
end