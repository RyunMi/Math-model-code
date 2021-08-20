#encoding=gb2312
from matplotlib import colors
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
df = pd.read_excel('table3.xls',header=None)
df=df.values
print(df)
x=np.arange(1,13)
plt.style.use('science')
fig, ax1 = plt.subplots()
ax2 = ax1.twinx()
ax1.plot(x,df[0],color='#36606A',marker='o',label=r'风速(m/s)',)
ax1.legend()
ax2.plot(x,df[1],linewidth=3,color='#D39570',marker='*',markersize=10,label=r'风功率密度($M/W^2$)')
ax2.legend()
ax1.set_xlabel('月份')
plt.show()