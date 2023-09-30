name=input("Enter the name:-" )
reverse=name[-1::-1]
print(reverse)

if(name==reverse):
    print("yes,it is palindrome")
else:
    print("No,it is not palindrome")