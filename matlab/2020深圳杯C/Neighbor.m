function route2=Neighbor(route1,pSwap,pReversion,pInsertion)
index=Roulette(pSwap,pReversion,pInsertion);
if index==1
    %�����ṹ
    route2=Swap(route1);
elseif index==2
    %��ת�ṹ
    route2=Reversion(route1);
else
    %����ṹ
    route2=Insertion(route1);
end
end
