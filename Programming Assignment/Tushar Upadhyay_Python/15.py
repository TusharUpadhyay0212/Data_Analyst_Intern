class Stack:
    def __init__(self):
        self.stack = []

    def push(self, data):
        self.stack.append(data)
        print(f"The data: {data} is pushed into the stack.")

    def pop(self):
        if len(self.stack) == 0:
            print("Stack is Empty")
            return None
        data = self.stack.pop()
        print(f"{data} is popped from the stack.")
        return data

def main():
    stack = Stack()
    while True:
        print("1 for push\n2 for pop\n3 for exit\n")
        option = int(input("Enter your choice: "))
        if option == 1:
            data = int(input("Enter the data: "))
            stack.push(data)
        elif option == 2:
            data = stack.pop()
            if data is not None:
                print(f"{data} is popped from stack.")
        elif option == 3:
            break
        else:
            print("Wrong option, try again.")

if __name__ == "__main__":
    main()

