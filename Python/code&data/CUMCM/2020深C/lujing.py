#encoding=gb2312
import pandas as pd
import numpy as np
from numpy import array,r_,c_,arange,savetxt
import matplotlib.pyplot as plt
path=[1,18,21,20,19,26,27,30,22,24,25,29,23,5,4,6,11,14,17,28,16,13,9,12,15,7,8,10,2,3,1]
index=(np.array(path)-1).tolist()
plt.style.use('science')
data=pd.read_excel('C题附件1.xlsx')
x=data.iloc[:,1]
x=np.array(x).flatten()
y=data.iloc[:,2]
y=np.array(y).flatten()
xy=c_[x,y];d1=array([[120.701520187911,36.3742269854581]])
xy=r_[xy,d1];
longtitude=xy[index,0]; latitude=xy[index,1];
plt.xlabel('经度');plt.ylabel('纬度')
for i in range(len(longtitude)):
    plt.text(longtitude[i],latitude[i],path[i],fontsize=15)
plt.plot(longtitude,latitude,'-*',markersize=10,linewidth=3)
plt.show()