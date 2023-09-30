
#1
print("* " * 8 )

#2
for i in range(5):
    for j in range(8):
        if i == 0 or i == 4 or j == 0 or j == 5:
            print("*", end=" ")
        else:
            print(" ", end=" ")
    print()

#3
for i in range(8):
    for j in range(8):
        if j == 0 or j == i or i == 7 and j%2==0:
            print("*", end=" ")
        else:
            print(" ", end=" ")
    print()
    
#4
for i in range(7):
    for j in range(15):
        if j == 6-i or j == 6+i or i == 6 and j%2==0:
            print("*", end="")
        else:
            print(" ", end="")
    print()