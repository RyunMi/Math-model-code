function route2=Reversion(route1)
n=length(route1);
seq=randperm(n-2)+1;
I=seq(1:2);
i1=min(I);
i2=max(I);
route2=route1;
route2(i1:i2)=route1(i2:-1:i1);
end

