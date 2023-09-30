class Shape:
    def __init__(self, color):
        self.color = color

    def compute_perimeter(self):
        pass

    def compute_area(self):
        pass

    def draw_shape(self):
        pass

import math

class Circle(Shape):
    def __init__(self, color, radius):
        super().__init__(color)
        self.radius = radius

    def compute_perimeter(self):
        return 2 * math.pi * self.radius

    def compute_area(self):
        return math.pi * (self.radius ** 2)

    def draw_shape(self):
        print(f"Drawing {self.color} circle with radius {self.radius}.")

class Rectangle(Shape):
    def __init__(self, color, length, width):
        super().__init__(color)
        self.length = length
        self.width = width

    def compute_perimeter(self):
        return 2 * (self.length + self.width)

    def compute_area(self):
        return self.length * self.width

    def draw_shape(self):
        print(f"Drawing {self.color} rectangle with length {self.length} and width {self.width}.")

class Trapezium(Shape):
    def __init__(self, color, base1, base2, height, side1, side2):
        super().__init__(color)
        self.base1 = base1
        self.base2 = base2
        self.height = height
        self.side1 = side1
        self.side2 = side2

    def compute_perimeter(self):
        return self.base1 + self.base2 + self.side1 + self.side2

    def compute_area(self):
        return 0.5 * (self.base1 + self.base2) * self.height

    def draw_shape(self):
        print(f"Drawing {self.color} trapezium with bases {self.base1} and {self.base2}, height {self.height}, and sides {self.side1}")


circle = Circle("red", 5)

perimeter = circle.compute_perimeter()
area = circle.compute_area()
color= circle.color
radius = circle.radius

print("Radius of the cicle:",radius)
print("Colour of the cicle:",color)
print("Perimeter of the circle:", perimeter)
print("Area of the circle:", area)






