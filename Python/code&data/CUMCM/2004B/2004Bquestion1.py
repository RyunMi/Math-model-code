import numpy as np
from sklearn.linear_model import LinearRegression
import pandas as pd
a=pd.read_excel("C:/Users/Ryun/desktop/question1.xlsx")
aa=a.iloc[:,1:9]
for i in range(0,6):
    bb=a.iloc[:,9+i]
    md=LinearRegression().fit(aa,bb)
    b0=md.intercept_; b12=md.coef_
    print(b0);print(b12)
    R=(md.score(aa,bb))
    print(R)