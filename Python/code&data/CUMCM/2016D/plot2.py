#encoding=gb2312
from matplotlib import colors
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
df = pd.read_excel('table2.xls',header=None)
df=df.values
print(df)
x=range(1,25)
new_ticks1=np.arange(1,13)
new_ticks2=np.arange(40,140,20)
plt.style.use('science')
fig, ax1 = plt.subplots()
ax2 = ax1.twinx()
ax1.bar(x,df[0],color='#D39570')
ax1.set_yticks(new_ticks1)
ax2.plot(x,df[1],linewidth=3,color='#36606A')
ax2.set_yticks(new_ticks2)
ax1.set_xlabel('时刻(点)')
ax1.set_ylabel(r'风速(m/s)', color='#D39570')
ax2.set_ylabel(r'风功率密度($M/W^2$)', color='#36606A')
plt.show()