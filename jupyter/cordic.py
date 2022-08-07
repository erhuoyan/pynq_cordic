from pynq import Overlay

import struct
import binascii

import random   
import cmath
import numpy as np

import matplotlib.pyplot as plt

X_ADDRESS = 0x10
Y_ADDRESS = 0x18
R_ADDRESS = 0x20
THETA_ADDRESS = 0x28

ol = Overlay('./cordic.bit')
cart2pol_ip = ol.cordiccart2pol_0

def cart2pol(x, y):
    # 数据类型转换
    x=(struct.unpack('<I', struct.pack('<f', x))[0])
    y=(struct.unpack('<I', struct.pack('<f', y))[0])
    
    cart2pol_ip.write(X_ADDRESS,x)
    cart2pol_ip.write(Y_ADDRESS,y)
    
    r=hex(cart2pol_ip.read(R_ADDRESS))                     
    r=r[2:]
    theta=hex(cart2pol_ip.read(THETA_ADDRESS))
    theta=theta[2:]
    
    if r!=0:
        r=struct.unpack('>f', binascii.unhexlify(r))
        r=r[0]
    if theta!=0:
        theta=struct.unpack('>f', binascii.unhexlify(theta))
        theta=theta[0]
        
    return r, theta

NUM_SAMPLES = 50

r_actual = np.zeros(NUM_SAMPLES)
theta_actual = np.zeros(NUM_SAMPLES)
r_predicted = np.zeros(NUM_SAMPLES)
theta_predicted = np.zeros(NUM_SAMPLES)

for i in range(NUM_SAMPLES):
    x = random.uniform(-1,1)
    y = random.uniform(-1,1)
    
    cn = complex(x,y)
    r_actual[i], theta_actual[i] = cmath.polar(cn)
    r_predicted[i], theta_predicted[i] = cart2pol(x, y)
    print(r_actual[i], r_predicted[i], theta_actual[i], theta_predicted[i])


r_diff=np.subtract(r_actual,r_predicted)
r_square=np.square(r_diff)
r_mse=r_square.mean()
r_rmse=np.sqrt(r_mse)

theta_diff=np.subtract(theta_actual,theta_predicted)
theta_square=np.square(theta_diff)
theta_mse=theta_square.mean()
theta_rmse=np.sqrt(theta_mse)


print("Radius RMSE: ", r_rmse, "Theta RMSE:", theta_rmse)

ind = np.arange(NUM_SAMPLES)
plt.figure(figsize=(10, 5))
plt.subplot(1,2,1)
plt.bar(ind,abs(r_diff))
plt.title("Radius Error")
plt.xlabel("Index")
plt.ylabel("Error")
#plt.xticks(ind)
plt.tight_layout()

plt.subplot(1,2,2)
plt.bar(ind,abs(theta_diff))
plt.title("Theta Error")
plt.xlabel("Index")
plt.ylabel("Error")
#plt.xticks(ind)
plt.tight_layout()