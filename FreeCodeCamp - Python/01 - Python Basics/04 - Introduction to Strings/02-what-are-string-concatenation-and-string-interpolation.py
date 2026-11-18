# Concatenate two or more strings with the + operator
my_str_1 = 'Hello'
my_str_2 = "World"

str_plus_str = my_str_1 + ' ' + my_str_2
print(str_plus_str)

# Strings can be repeated by multiplying with the '*' operator
sound = 'ha'
repeated_sound = sound * 3
print(repeated_sound)

# Concatenation only works with strings, the below example will throw an error
name = 'John Doe'
age = 26

# name_and_age = name + age (can only concatenate str (not "int") to str)
# Python requires all elements to be strings before it can concatenate them
# Convert an integer to a string by using the str() function
name = 'John Doe'
age = 26

name_and_age = name + str(26)
print(name_and_age)

# Augmented assignment performs both concatenation and assignment at the same time.
# It is represented by the += operator

name = 'John Doe'
age = 26

name_and_age = name
name_and_age += str(age)
print(name_and_age)

# It can also be used for repeating strings
sound = 'ha'
sound *= 3
print(sound)

# Inserting variables and expressions into strings is called string interpolation.
# f-strings (short for formatted string literals) allows you to handle interpolation with a compact and readable syntax.
# f-string start with 'f' and allows you to use embed expressions inside fields indicated by curly braces {}.
name = 'John Doe'
age = 26
name_and_age = f'My name is {name} and I am {age} years old.'
print(name_and_age)

num1 = 5
num2 = 10
print(f'The sum of {num1} and {num2} is {num1 + num2}.')