#encoding=gb2312
import matplotlib.pyplot as plt
plt.style.use('science')
year=range(2005,2015)
price=[0.70,0.70,0.70,0.70,0.77,0.90,0.93,1.02,1.20,1.32]
years=range(2005,2018)
forecast=[0.70,0.65,0.70,0.76,0.82,0.89,0.96,1.04,1.13,1.22,1.33,1.44,1.52]
plt.figure()
plt.plot(year,price,linewidth=5,label='收购价格')
plt.plot(years,forecast,linewidth=5,label='收购价格')
plt.legend()
plt.xlabel('年份')
plt.ylabel('价格(元/每斤)')
plt.xticks(years)
plt.show()