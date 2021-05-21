import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import minimize

df = pd.read_csv('log_returns.csv')
df = df.drop('Unnamed: 0', axis = 1)
df = df.drop('Date', axis = 1)

np.random.seed(42)
num_ports = 1000*1000*1000
all_weights = np.zeros((num_ports, df.shape[1]))
ret_arr = np.zeros(num_ports)
vol_arr = np.zeros(num_ports)
sharpe_arr = np.zeros(num_ports)

for x in range(num_ports):
    if x%6000 == 0:
        print(x)
    # Weights
    weights = np.array(np.random.random(df.shape[1]))
    weights = weights/np.sum(weights)
    # Save weights
    all_weights[x,:] = weights
    # Expected return
    ret_arr[x] = np.sum((df.mean() * weights*252))
    # Expected volatility
    vol_arr[x] = np.sqrt(np.dot(weights.T, np.dot(df.cov()*252, weights)))
    # Sharpe Ratio
    sharpe_arr[x] = ret_arr[x]/vol_arr[x]


x = sharpe_arr.argmax()
mr = ret_arr[x]
mv = vol_arr[x]

fy = np.linspace(-0.1,0.5,50)

def get_ret_vol_sr(weights):
    weights = np.array(weights)
    ret = np.sum(df.mean() * weights) * 252
    vol = np.sqrt(np.dot(weights.T, np.dot(df.cov()*252, weights)))
    sr = ret/vol
    return np.array([ret, vol, sr])

def min_vol(weights):
    return get_ret_vol_sr(weights)[1]

def check_sum(weights):
    #return 0 if sum of the weights is 1
    return np.sum(weights)-1

a = 1/48
c = ((0,1),)
b = []
d = ()
for i in range(48):
    b.append(a)
    d = d+c


fx = []

for i in fy:
    print(i)
    cons = ({'type':'eq', 'fun':check_sum},
            {'type':'eq', 'fun': lambda w: get_ret_vol_sr(w)[0] - i})
    
    result = minimize(min_vol, b, method='SLSQP', bounds=d, constraints=cons)
    fx.append(result['fun'])

plt.figure(figsize=(15,8))
plt.scatter(vol_arr, ret_arr, c=sharpe_arr, cmap='viridis')
plt.colorbar(label='Sharpe Ratio')
plt.xlabel('Volatility')
plt.ylabel('Return')
plt.plot(fx,fy, 'r--', linewidth=3)
plt.savefig('cover.png')
plt.show()

