# String slicing (string[start:stop])

my_str = "Hello world!"
print(my_str[1:4])  # Output: ell
print(my_str[:6])  # Output: Hello (emitting start index)
print(my_str[3:]) # Output: lo world! (emitting stop index)

# Extract every second character using steps
print(my_str[0:12:2])  # Output: Hlowrd (start:stop:step)

# Reverse using negative step
print(my_str[::-1]) # Output: !dlrow olleH (start:stop:step)