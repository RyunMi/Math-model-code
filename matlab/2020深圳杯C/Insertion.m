function route2=Insertion(route1)
n=length(route1);
seq=randperm(n-2)+1;
I=seq(1:3);
i1=median(I);
i2=min(I);
i3=max(I);
route2=route1([1:i2 i1 i1+1:i3 i2+1:i1-1 i3+1:end]);
end

