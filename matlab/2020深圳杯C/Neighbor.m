function route2=Neighbor(route1,pSwap,pReversion,pInsertion)
index=Roulette(pSwap,pReversion,pInsertion);
if index==1
    %交换结构
    route2=Swap(route1);
elseif index==2
    %逆转结构
    route2=Reversion(route1);
else
    %插入结构
    route2=Insertion(route1);
end
end
