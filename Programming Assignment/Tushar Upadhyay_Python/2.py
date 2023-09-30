import sys


a = float(sys.argv[1])
b = float(sys.argv[2])
c = float(sys.argv[3])
d = float(sys.argv[4])
e = float(sys.argv[5])

# 2a. 
a += 1
print("Result of ++a:", a)

# 2b. 
a_old = a
a += 1
print("Result of a++:", a_old)

# 2c. 
numerator = a_old + b
b += 1
c += 1
result_2c = numerator / c
print("Result of (a++ + b++) / c++:", result_2c)

# 2d. 
d += 1
denominator = b * (c + d)
result_2d = a / denominator
print("Result of a/(b*(c + ++d)):", result_2d)

# 2e.
b += 1
c += 1
d -= 1
result_2e = a ** b + b ** c + c ** d + d ** e
print("Result of a^b++ + b ^ ++c + c ^ --d + d ^ e--:", result_2e)
