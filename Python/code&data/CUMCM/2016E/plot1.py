#encoding=gb2312
import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import palettable
#plt.style.use('science')
plt.rcParams['font.sans-serif']=['KaiTi']
plt.rcParams['axes.unicode_minus']=False
df = pd.read_excel('Spearmanhunan.xlsx')
print(df.columns)
d=df.iloc[:,0:12]
new_ticks=['X1', 'X2', 'X3', 'X4', 'X5', 'X6','X7', 'X8', 'X9', 'X10', 'X11', 'X12']
# corr函数计算相关性矩阵(correlation matrix)
dcorr = d.corr(method='spearman')#默认为'pearson'检验，可选'kendall','spearman'
plt.figure(figsize=(15, 10),dpi=100)
ax=sns.heatmap(data=dcorr,
            vmax=0.3, 
            cmap=palettable.cmocean.sequential.Deep_20.mpl_colors[0:12],
            annot=True,
            fmt=".2f",
            annot_kws={'size':8,'weight':'normal', 'color':'#253D24'},
            #mask=np.triu(np.ones_like(dcorr,dtype=np.bool)),#显示对脚线下面部分图
            square=True, linewidths=.5,#每个方格外框显示，外框宽度设置
            cbar_kws={"shrink": .5},
            mask=abs(dcorr)<0.45,
           )
ax.set_xticklabels(ax.get_xticklabels(), rotation=-60)
ax.set_yticklabels(ax.get_yticklabels(), rotation=60)
ax.tick_params(axis='x',labelsize=11.7)
ax.tick_params(axis='y',labelsize=11.7)  
ax.xaxis.tick_top()
#ax.set_xticks(new_ticks)
#plt.xticks(new_ticks)
plt.show()