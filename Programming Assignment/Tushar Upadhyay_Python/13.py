from array import *
import random

arr=array("i",[])
n=100

for i in range(100):
    num= random.randint(0,1000)
    arr.append(num)
print(arr)

unique=set(arr)
print(unique)
