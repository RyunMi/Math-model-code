for i=3000:50:1500
    Hu(3)=i;
    Huu=mapminmax('apply',Hu,PS1);
    Ww=sim(net1,Huu);
    Wn=mapminmax('reverse',Ww,PS2)
end
    