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