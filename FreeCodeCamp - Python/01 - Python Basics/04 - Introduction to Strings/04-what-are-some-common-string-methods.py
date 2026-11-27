# Convert to uppercase
my_str="hello world"
uppercase_my_str=my_str.upper()
print(uppercase_my_str) # Output: HELLO WORLD

# Convert to lowercase
my_str="Hello World"
lowercase_my_str=my_str.lower()
print(lowercase_my_str) # Output: hello world

# Strip 
my_str = "    hello world   "
trimmed_my_str = my_str.strip()
print(trimmed_my_str) # Output: hello world

# Replace
my_str = "hello world"
replaced_my_str = my_str.replace("hello", "hi")
print(replaced_my_str) # Output hi world

# Split 
my_str = "hello world"
split_words = my_str.split()
print(split_words) # Output: ['hello', 'world']

# Join
my_list = ['hello', 'world']
joined_my_str = " ".join(my_list)
print(joined_my_str) # Output: hello world

# Startswith
my_str = "hello world"
print(my_str.startswith("hello")) # Output: True

# Endswith
my_str = "hello world"
print(my_str.endswith("world")) # Output: True

# Find
my_str = "hello world"
print(my_str.find("world")) # Output: 6

# Count
my_str = "hello world"
print(my_str.count("o")) # Output: 2

# Capitalize
my_str = "hello world"
capitalized_my_str = my_str.capitalize()
print(capitalized_my_str) # Output: Hello world

# isupper
my_str = "Hello world"
is_all_upper = my_str.isupper()
print(is_all_upper) # Output: False

# islower
my_str = "hello world"
is_all_lower = my_str.islower()
print(is_all_lower) # Output: True

# title
my_str = "hello world"
title_case_my_str = my_str.title()
print(title_case_my_str) # Output: Hello World