#encoding=gb2312
from matplotlib import colors
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
df = pd.read_excel('table4.xlsx',header=None)
df=(df.values).flatten()
print(df.shape)
x=np.arange(1,25)
plt.style.use('science')
x0=3
x1=25
y0=1500
xticks=[0,3,5,10,15,20,25]
plt.plot([x0,x0],[0,y0],'-',linewidth=2.5)
plt.plot([x1,x1],[0,y0],'-',linewidth=2.5)
plt.hist(df,bins=23)
plt.annotate(r'有效风速区间',xy=(x0, 1450), xycoords='data', xytext=(+350, -3),textcoords='offset points', fontsize=16,arrowprops=dict(arrowstyle='->'))
plt.annotate(r'占比:84%',xy=(x1, 1450), xycoords='data', xytext=(-400, -3),textcoords='offset points', fontsize=16,arrowprops=dict(arrowstyle='->'))
plt.xlabel('风速(m/s)')
plt.ylabel(r'频数')
plt.xticks(xticks)
plt.show()