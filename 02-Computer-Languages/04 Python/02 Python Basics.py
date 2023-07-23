
# %%
print("Hello, World!")


# %%
# This is a comment
print("Hello, World!")


# %%
x = 5
y = "John"
print(x)
print(y)


# %%
x = str(3)    # x will be '3'
y = int(3)    # y will be 3
z = float(3)  # z will be 3.0


# %%
x, y, z = "Orange", "Banana", "Cherry"
print(x)
print(y)
print(z)


# %%
x = "Python"
y = "is"
z = "awesome"
print(x, y, z)


# %%
a = '''Lorem ipsum dolor sit amet,
consectetur adipiscing elit,
sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua.'''
print(a)


# %%
b = "Hello, World!"
print(b[2:5])
print(b[:5])
print(b[2:])
print(b[-5:-2])


# %%
a = "Hello, World!"
print(a.upper())
print(a.lower())

a = " Hello, World! "
print(a.strip()) # returns "Hello, World!"

a = "Hello, World!"
print(a.replace("H", "J"))

a = "Hello, World!"
print(a.split(",")) # returns ['Hello', ' World!']


# %%
a = "Hello"
b = "World"
c = a + " " + b
print(c)

# %%
mylist = ["apple", "banana", "cherry"]


# %%
mytuple = ("apple", "banana", "cherry")


# %%
myset = {"apple", "banana", "cherry"}


# %%
thisdict = {
  "brand": "Ford",
  "model": "Mustang",
  "year": 1964
}


# %%
a = 33
b = 200
if b > a:
  print("b is greater than a")


# %%
i = 1
while i < 6:
  print(i)
  i += 1


# %%
fruits = ["apple", "banana", "cherry"]
for x in fruits:
  print(x)


# %%
def my_function(fname):
  print(fname + " Refsnes")

my_function("Emil")
my_function("Tobias")
my_function("Linus")


# %%
class Person:
  def __init__(self, name, age):
    self.name = name
    self.age = age

  def myfunc(self):
    print("Hello my name is " + self.name)

p1 = Person("John", 36)
p1.myfunc()

