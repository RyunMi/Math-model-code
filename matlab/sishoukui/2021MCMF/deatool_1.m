clc,clear;
Z_1=xlsread('America.xlsx');
Z_2=xlsread('china.xlsx');
Z_3=xlsread('bolo.xlsx');
Z_4=xlsread('Chezk.xlsx');
Z_5=xlsread('Mexico.xlsx');
Z_6=xlsread('xyl.xlsx');
Z_7=xlsread('Argentina.xlsx');
Z={Z_1,Z_2,Z_3,Z_4,Z_5,Z_6,Z_7};
X_1=Z{1}(:,2:6); X_2=Z{2}(:,2:6); X_3=Z{3}(:,2:6); X_4=Z{4}(:,2:6); X_5=Z{5}(:,2:6); X_6=Z{6}(:,2:6); X_7=Z{7}(:,2:6);
X={X_1,X_2,X_3,X_4,X_5,X_6,X_7};
b_1=Z{1}(:,end-5:end);b_2=Z{2}(:,end-5:end);b_3=Z{3}(:,end-5:end);b_4=Z{4}(:,end-5:end);b_5=Z{5}(:,end-5:end);b_6=Z{6}(:,end-5:end);b_7=Z{7}(:,end-5:end);
b={b_1,b_2,b_3,b_4,b_5,b_6,b_7};
F_1=[-0.73,0.855,0.039,0.051,0.264,0.270];
F_2=[1.034,-0.693,0.225,0.212,-0.023,-0.031];
Yhat_1=b{1}*F_1';Yhat_2=b{2}*F_1';Yhat_3=b{3}*F_1';Yhat_4=b{4}*F_1';Yhat_5=b{5}*F_1';Yhat_6=b{6}*F_1';Yhat_7=b{7}*F_1';
Yba_1=b{1}*F_2';Yba_2=b{2}*F_2';Yba_3=b{3}*F_2';Yba_4=b{4}*F_2';Yba_5=b{5}*F_2';Yba_6=b{6}*F_2';Yba_7=b{7}*F_2';
Y_1=[Yhat_1,Yba_1];Y_2=[Yhat_2,Yba_2];Y_3=[Yhat_3,Yba_3];Y_4=[Yhat_4,Yba_4];Y_5=[Yhat_5,Yba_5];Y_6=[Yhat_6,Yba_6];Y_7=[Yhat_7,Yba_7];
Y={Y_1,Y_2,Y_3,Y_4,Y_5,Y_6,Y_7};
super_1=deasuper(X_1, Y_1, 'orient', 'io');super_2=deasuper(X_2, Y_2, 'orient', 'io');super_3=deasuper(X_3, Y_3, 'orient', 'io');super_4=deasuper(X_4, Y_4, 'orient', 'io');
super_5=deasuper(X_5, Y_5, 'orient', 'io');super_6=deasuper(X_6, Y_6, 'orient', 'io');super_7=deasuper(X_7, Y_7, 'orient', 'io');
for i=1:7
    %io_i=dea(X_i,Y_i,'orient','io');
    %deadisp(io);
    %io_scale_i=deascale(X_i,Y_i,'orient','io');
    %deadisp(io_scale);
    super={super_1,super_2,super_3,super_4,super_5,super_6,super_7};
    %deadisp(super);
    if numel(find(isnan(super{i}.eff)))~=0
        super{i}.eff(find(isnan(super{i}.eff)),:)=(sum(super{i}.eff(1:find(isnan(super{i}.eff))-1,:))+sum(super{i}.eff(find(isnan(super{i}.eff))+1:end,:)))/17;
    end
end
t=Z_1(1:end,1);
plot(t,super_1.eff,t,super_2.eff,t,super_3.eff,t,super_4.eff,t,super_5.eff,t,super_6.eff,t,super_7.eff)
legend('America','China','Bolo','Chezk','Mexico','Hu','Ar')
me_1=mean(super_1.eff);me_2=mean(super_2.eff);me_3=mean(super_3.eff);me_4=mean(super_4.eff);me_5=mean(super_5.eff);me_6=mean(super_6.eff);
me_7=mean(super_7.eff);
me=[me_1,me_2,me_3,me_4,me_5,me_6,me_7];