import numpy as np
import cvxpy as cp
import pandas as pd
x=cp.Variable((8,12),integer=True)
shuju=pd.read_excel('question3.xlsx',header=None)
T=shuju.iloc[0:8,1:13]
P=shuju.iloc[9:17,1:13]
xx=shuju.iloc[18,1:9]
v=shuju.iloc[19,1:9]
T=T.values
P=P.values
xx=xx.values
v=v.values
T1=xx+15*v
T1=T1.reshape(8,1)
T2=xx-15*v
T2=T2.reshape(8,1)
Aeq=np.zeros((8,96))
for i in range(0,8):
    for j in range(12*(i),12*(i)+12):
        Aeq[i,j]=1
beq=np.ones((8,1))
A=np.zeros((17,96))
for m in range(0,8):
    for n in range(12*(m+1),12*(m+2),12):
        A[m,n-12:n]=T[m,:]
for p in range(8,16):
    for q in range(12*(p-7),12*(p-6),12):
        A[p,q-12:q]=-T[p-8,:]
for u in range(0,96,12):
    A[-1,u:u+12]=-T[int(u/12),:]
b=np.concatenate((T1,-T2),axis=0)
b=np.append(b,-982.4)
b=b.reshape(17,1)