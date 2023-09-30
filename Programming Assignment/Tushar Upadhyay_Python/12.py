from array import *
arr1=array("i",[])
arr2=array("i",[])
n=int(input("Enter the no. of element"))

for i in range(0,n):
    num1=int(input("Enter the next element of array 1:- "))
    arr1.append(num1)
print(arr1)
for i in range(0,n):
    num2=int(input("Enter the next element of array 2:- "))
    arr2.append(num2)
print(arr2)

if set(arr1)==set(arr2):
    print("the array is same")
else:
    print("array is not same")

if arr1==arr2:
    print("the array is same")
else:
    print("array is not same")
