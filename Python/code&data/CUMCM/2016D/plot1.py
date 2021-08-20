#encoding=gb2312
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
df = pd.read_excel('table1.xlsx')
df=df.values
plt.style.use('science')
new_ticks = [1,8,12,18,24]
print(new_ticks)
for i in range(4):
    plt.subplot(2,2,i+1)
    for j in range(3*(i),3*(i+1)):
        plt.plot(range(1,25),df[j],linewidth=2)
    if i == 0:
        plt.legend(labels=('一月', '二月', '三月'))
    elif i ==1:
        plt.legend(labels=('四月', '五月', '六月'))
    elif i==2:
        plt.legend(labels=('七月', '八月', '九月'))
    elif i==3:
        plt.legend(labels=('十月', '十一月', '十二月'))
    plt.xlabel('时刻(点)')
    plt.ylabel(r'风速(m/s)')
    plt.xticks(new_ticks)
plt.show()