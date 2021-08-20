#encoding=gb2312
import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import palettable
plt.rcParams['font.sans-serif']=['KaiTi']
plt.rcParams['axes.unicode_minus']=False
df = pd.read_excel('Spearmanliaoning.xlsx')
print(df.columns)
d=df.iloc[:,0:12]
dcorr = d.corr(method='spearman')
plt.figure(figsize=(15, 10),dpi=100)
ax=sns.heatmap(data=dcorr,
            vmax=0.3, 
            cmap=palettable.cmocean.sequential.Tempo_20.mpl_colors[0:12],
            annot=True,
            fmt=".2f",
            annot_kws={'size':8,'weight':'normal', 'color':'#253D24'},
            square=True, linewidths=.5,
            cbar_kws={"shrink": .5},
            mask=abs(dcorr)<0.45,
           )
ax.set_xticklabels(ax.get_xticklabels(), rotation=-60)
ax.set_yticklabels(ax.get_yticklabels(), rotation=60)
ax.tick_params(axis='x',labelsize=11.7)
ax.tick_params(axis='y',labelsize=11.7)  
ax.xaxis.tick_top()
plt.show()