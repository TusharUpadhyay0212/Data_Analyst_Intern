from array import *

arr=[]
n=10

for i in range(10):
    num=int(input("Enter the next number= "))
    arr.append(num)
print("The array is:- ",arr)
arr.sort()
print("Sorted list in ascending order:", arr)

arr.sort(reverse=True)
print("Sorted list in decesnding order:", arr)
