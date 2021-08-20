#encoding=gb2312
from matplotlib import colors
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import palettable
df = pd.read_excel('table5.xlsx',header=None)
df=(df.values)/100
print(df)
x=np.arange(1,13)
plt.style.use('science')
new_ticks1=np.linspace(0,0.7,8)
new_ticks2=np.arange(1,13)
plt.barh(x,df[0],color=palettable.colorbrewer.qualitative.Paired_12.mpl_colors)
plt.xticks(new_ticks1)
plt.yticks(new_ticks2)
for p, q in zip(x, df[0]):
    # ha: ˮƽ���뷽ʽ
    # va: ��ֱ��������
    plt.text(q +0.02, p -0.2, '%.3f'%q,ha='center', va='bottom',fontdict={'size': 16})
plt.xlabel('��������ϵ��')
plt.ylabel(r'�·�')
plt.show()