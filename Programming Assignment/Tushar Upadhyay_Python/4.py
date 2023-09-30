
print("select the operation want to perform:-\nA-ADDITION\nS-SUBRACTION\nM-MULTIPLCATION\nD-DIVIDE\n")
while True:
  operation=input("Enter the operation want to perform = ")
  num1= int(input("Enter the first number = "))
  num2= int(input("Enter the second number = "))
  if operation=="A":
    print("The addition of the number is",num1+num2)
  elif operation=="S":
    print("The Subtraction of the number is",num1-num2)
  elif operation=="M":
    print("The Multiplication of the number is",num1*num2)
  elif operation=="D":
    print("The Division of the number is",num1/num2)
  else:
    print("Invalid operator")

  choice =input("Do you want to perform another calculation? (Y/N):" )
  if choice != "Y":
    break
