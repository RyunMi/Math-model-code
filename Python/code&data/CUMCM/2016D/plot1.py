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
        plt.legend(labels=('һ��', '����', '����'))
    elif i ==1:
        plt.legend(labels=('����', '����', '����'))
    elif i==2:
        plt.legend(labels=('����', '����', '����'))
    elif i==3:
        plt.legend(labels=('ʮ��', 'ʮһ��', 'ʮ����'))
    plt.xlabel('ʱ��(��)')
    plt.ylabel(r'����(m/s)')
    plt.xticks(new_ticks)
plt.show()