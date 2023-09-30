class Employee:
    def __init__(self, name, age, salary):
        self.name = name
        self.age = age
        self.salary = salary

    def work(self):
        print(f"{self.name} is working.")

class Programmer(Employee):
    def __init__(self, name, age, salary, programming_language):
        super().__init__(name, age, salary)
        self.programming_language = programming_language

    def code(self):
        print(f"{self.name} is coding in {self.programming_language}.")

class Manager(Employee):
    def __init__(self, name, age, salary, team_size):
        super().__init__(name, age, salary)
        self.team_size = team_size

    def manage(self):
        print(f"{self.name} is managing a team of {self.team_size} employees.")


employee = Employee("John", 30, 50000)
employee.work()

programmer = Programmer("Alice", 25, 60000, "Python")
programmer.code()

manager = Manager("Bob", 35, 70000, 10)
manager.manage()
