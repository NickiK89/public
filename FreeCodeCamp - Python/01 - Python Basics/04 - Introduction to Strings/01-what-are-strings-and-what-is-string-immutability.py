my_str_1 = 'Hello'
my_str_2 = "World"
my_str_3 = """Multiline
string"""
my_str_4 = '''Another
multiline
string'''
# Escape with backslash
msg = 'It\'s a sunny day'
quote = "She said, \"Hello World!\""

# Escape sequences
#\n - New line
#\t - Tab
#\\ - A single backslash

print('Hello\nworld')

print('Name:\tAlice')
print('C:\\Users\\Alice\\Desktop')

# Check if a string contains one or more characters
my_str = 'Hello world'
print ('Hello' in my_str) # True
print ('hey' in my_str) # False
print ('e' in my_str) # True

# Check length of a string
my_str = 'Hello world'
print(len(my_str)) # 11

# Get the character in a specific position
print(my_str[0]) # H
print(my_str[3]) # l

# Last character (negative indexing)
print(my_str[-1]) # d

# Second to last character
print(my_str[-2]) # l

# Values can be mutable (editable) or immutable (not editable). 
# String are immmutable, but their values can be reassigned.
greeting = 'hi'
print(greeting)
greeting = 'hello'
print(greeting)

# Direct modification is not allowed
greeting = 'hi'

# greeting[0] = 'H' <-- This will throw an error