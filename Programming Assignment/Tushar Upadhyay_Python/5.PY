import math

while True:
        num1 = float(input("Enter a number: "))
        OPERATION = input("Enter an operator (A,S, M, D, ^, e, %, sin, cos, tan): ")
        if  OPERATION == "sin" or  OPERATION == "cos" or  OPERATION == "tan":
            if OPERATION == "sin":
                result = math.sin(num1)
            elif OPERATION == "cos":
                result = math.cos(num1)
            else:
                result = math.tan(num1)
            print(result)
        elif OPERATION == "^":
            num2 = float(input("Enter the power: "))
            result = num1 ** num2
            print(result)
        elif OPERATION == "e":
            result = math.exp(num1)
            print(result)
        elif OPERATION == "%":
            num2 = float(input("Enter the modulus: "))
            result = num1 % num2
            print(result)
        else:
            num2 = float(input("Enter another number: "))
            if OPERATION == "A":
                result = num1 + num2
            elif OPERATION == "S":
                result = num1 - num2
            elif op == "M":
                result = num1 * num2
            elif OPERATION == "D":
                result = num1 / num2
            else:
                print("Invalid operator. Please try again.")
                continue
            print(result)
        choice = input("Do you want to perform another calculation? (Y/N): ")
        if choice != "Y":
            break
