data=xlsread('data.xlsx','A1:F2');
c=data(1,:);
k=data(2,:);
vci=[3,3.5,3,3,3];
vr=[11,11.5,10.5,11,11.5];
vb=25;
syms v
for i=1:6
    for j=1:5
        result(i,j)=integral((@(v) (v-vci(j)).^3.*v.^(k(i)-1).*exp(-(v/c(i)).^k(i))),vci(j),vr(j));
        result(i,j)=(k(i)/((vr(j)-vci(j)).^3.*c(i).^k(i))).*result(i,j);
        result(i,j)=result(i,j)+(k(j)/c(j).^k(j)).*integral(@(v) (v.^(k(j)-1).*exp(-(v/c(j)).^k(j))),vr(j),vb);
    end
end
result;