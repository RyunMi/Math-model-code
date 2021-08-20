#encoding=gb2312
from gurobipy import *
from scipy.spatial.distance import pdist, squareform
v = 5
n = 13
c = 6
demands = [0,1.2,1.7,1.5,1.4,1.7,1.4,1.2,1.9,1.8,1.6,1.7,1.1]
xy = [(81.5,41.5), (87,37), (75,53), (85,52), (89,41), (77,58), (76,45), (87,53), (73,38), (77,38), (73,31), (91,47), (92,44)]
distances = squareform(pdist(xy))
try:
    m = Model('cvrp')
    # 决策变量
    I = range(1, n+1)
    J = range(1, n+1)
    K = range(1, v+1)
    x = m.addVars(I, J, K, vtype = GRB.BINARY, name = "x")
    y = m.addVars(I, K, vtype = GRB.BINARY, name = 'y')
    z = m.addVars(I, K, vtype = GRB.CONTINUOUS, name = "z")
    # 更新变量
    m.update()
    # 目标函数
    m.setObjective(sum(distances[i-1,j-1]*x[i,j,k] for i in I for j in J for k in K), GRB.MINIMIZE)
    # 约束条件
    m.addConstrs(sum(y[i, k] for k in K) == 1 for i in I[1 :])
    m.addConstr(sum(y[1, k] for k in K) <= v)
    m.addConstrs(sum(demands[i-1]*y[i, k] for i in I) <= c for k in K)
    m.addConstrs(x[i,j, k] == 0 for i in I for j in J for k in K if i == j)
    m.addConstrs(sum(x[i,j,k] for j in J) == sum(x[j,i,k] for j in I) for i in I for k in K)
    m.addConstrs(sum(x[i,j,k] for i in I) == y[j,k] for j in J for k in K)
    m.addConstrs(sum(x[i,j,k] for j in J) == y[i,k] for i in I for k in K)
    m.addConstrs(z[i,k]-z[j,k]+c*x[i,j,k] <= c-demands[i-1] for i in I[1:] for j in J[1:] for k in K if i != j and demands[i-1]+demands[j-1] <= c)
    m.addConstrs(z[i,k] <= c for i in I[1:] for k in K)
    m.addConstrs(z[i,k] >= demands[i-1] for i in I[1:] for k in K)
    
    #求解
    m.optimize()
except GurobiError:
    print('error reported')