function JF=JFk2(x)
n=length(x); JF=zeros(n,n);
for i=1:n
    for j= 1:n
        if i==j && ~mod(j,2)
            JF(i,j)=0;
        elseif i==j && mod(j,2)
            JF(i,j)=-20*x(i);
        end
        if (i-j)==1 && ~mod(j,2)
            JF(i,j)=0;
        elseif (i-j)==1 && mod(j,2)
            JF(i,j)=-1;
        end
        if (j-i)==1 && ~mod(i,2)
            JF(i,j)=0;
        elseif (j-i)==1 && mod(i,2)
            JF(i,j)=10;
        end
    end
end