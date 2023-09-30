from array import *

arr=array("i",[])
n=10

for i in range(10):
    num=int(input("Enter the next number= "))
    arr.append(num)

    average= sum(arr)/len(arr)
print(arr)
print(average)
2