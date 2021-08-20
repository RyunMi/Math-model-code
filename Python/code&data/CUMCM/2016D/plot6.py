#coding=gb2312
from pyecharts import options as opts
from pyecharts.charts import Pie
from pyecharts.faker import Faker
import pandas as pd
df=pd.read_excel('table6.xlsx')
df=df.values
v1 = ['4#','������','������','������']
v2 = ['16#','������','������','������']
v3 = ['24#','������','������','������']

c = (
    Pie()
    .add(
        "",
        [list(z) for z in zip(v1, df[0,:])],
        radius=["15%", "40%"],
        center=["180", "300"],
        rosetype="area",
    )
    .add(
        "",
        [list(z) for z in zip(v2, df[1,:])],
        radius=["15%", "40%"],
        center=["460", "150"],
        rosetype="area",
    )
    .add(
        "",
        [list(z) for z in zip(v3, df[2,:])],
        radius=["15%", "40%"],
        center=["740", "300"],
        rosetype="area",
    )
    .set_global_opts(title_opts=opts.TitleOpts(title="����һ���»��ͶԱ�ͼ"))
    .render("pie_rosetype.html")
)
#����������snapshot pie_rosetype.html pdf����PDF�ļ�