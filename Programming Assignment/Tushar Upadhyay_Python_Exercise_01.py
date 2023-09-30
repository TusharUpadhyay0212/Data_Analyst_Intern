class Engine:
    def __init__(self, horsepower):
        self.horsepower = horsepower

class Wheel:
    def __init__(self, number_of_wheels):
        self.number_of_wheels = number_of_wheels

class Color:
    def __init__(self, color):
        self.color = color

class Transmission:
    def __init__(self, transmission_type):
        self.transmission_type = transmission_type

class Car:
    def __init__(self, make, model, engine, wheel, color, transmission):
        self.make = make
        self.model = model
        self.engine = engine
        self.wheel = wheel
        self.color = color
        self.transmission = transmission

engine = Engine(200)
wheel = Wheel(4)
color = Color('blue')
transmission = Transmission('manual')
car = Car('Maruti', 'Baleno', engine, wheel, color, transmission)

print(f"{car.make} {car.model} has {car.engine.horsepower}hp engine with {car.wheel.number_of_wheels} wheels and {car.transmission.transmission_type} transmission in {car.color.color} color.")
