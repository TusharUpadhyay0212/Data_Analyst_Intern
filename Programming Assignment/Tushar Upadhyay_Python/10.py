from array import *

arr=array("i",[])
n=10

for i in range(10):
    num=int(input("Enter the next number= "))
    arr.append(num)
print("The array is:- ",arr)
val= int(input("Enter the value want to search:- "))
print(arr.index(val))