# Python Cheat Sheet

## Python Syntax

### Basic Syntax (vs Swift)
| Concept | Python | Swift |
|---------|---------|--------|
| Variable Declaration | `x = 42` | `var x = 42` |
| Constant Declaration | `PI = 3.14` | `let PI = 3.14` |
| Type Annotation | `x: int = 42` | `var x: Int = 42` |
| String Interpolation | `f"Value: {x}"` | `"Value: \(x)"` |
| Multi-line String | `"""text"""` | `"""text"""` |
| Comments | `# comment` | `// comment` |

### Data Types
| Type | Python | Swift |
|------|---------|--------|
| Integer | `int` | `Int` |
| Float | `float` | `Double` |
| String | `str` | `String` |
| Boolean | `bool` | `Bool` |
| List | `list` | `Array` |
| Dictionary | `dict` | `Dictionary` |
| Set | `set` | `Set` |
| Tuple | `tuple` | `(Type, Type)` |

### Collections
```python
# Lists (Arrays)
numbers = [1, 2, 3]
numbers.append(4)  # [1, 2, 3, 4]
numbers.extend([5, 6])  # [1, 2, 3, 4, 5, 6]
first = numbers[0]  # 1
last = numbers[-1]  # 6

# Dictionaries
person = {
    "name": "John",
    "age": 30
}
person["email"] = "john@example.com"
```

### Control Flow
```python
# If Statements
if x > 0:
    print("Positive")
elif x < 0:
    print("Negative")
else:
    print("Zero")

# Loops
for i in range(5):
    print(i)

for item in items:
    print(item)

while condition:
    print("Looping")
```

### Functions and Classes
```python
# Functions
def greet(name: str) -> str:
    return f"Hello, {name}!"

# Lambda (similar to Swift closures)
square = lambda x: x ** 2

# Classes
class Person:
    def __init__(self, name: str, age: int):
        self.name = name
        self.age = age
    
    def greet(self) -> str:
        return f"Hello, I'm {self.name}"
```

### Common Pitfalls for Swift Developers
1. **Indentation**: Python uses indentation for code blocks (no braces)
2. **Type Safety**: Python is dynamically typed (unlike Swift's static typing)
3. **Optional Handling**: Python uses `None` instead of Swift's `Optional`
4. **Protocols**: Python uses "duck typing" instead of Swift's protocols
5. **Access Control**: Python uses naming conventions (`_private`) instead of Swift's access modifiers

## Install Python on a Mac

1. Uninstall existing Python installations (except system Python and pyenv Pythons)

```shell
# Remove brew Python versions (if brew is installed)
brew list | grep python | xargs brew uninstall --force

# Remove Python.org installer versions
sudo rm -rf /Library/Frameworks/Python.framework
sudo rm -rf /Applications/Python* # symlinks
sudo rm -rf /usr/local/bin/python*
sudo rm -rf /usr/local/bin/pip*
sudo rm -rf /usr/local/bin/idle*
sudo rm -rf /usr/local/bin/pydoc*
sudo rm -rf /usr/local/bin/pyvenv*
sudo rm -rf /usr/local/bin/py*
sudo rm -rf /usr/local/bin/wheel*
sudo rm -rf /usr/local/bin/easy_install*
```

2. Install Homebrew (if not already installed)

```shell
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to shell (append to ~/.zshrc)
text_to_append='

# setup homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"'

echo "$text_to_append" >> ~/.zshrc

# Apply changes to current shell
source ~/.zshrc
```

3. Install pyenv (if not already installed)

```shell
# Install pyenv
brew install pyenv

# Add pyenv to shell (append to ~/.zshrc)
text_to_append='

# setup pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"'

echo "$text_to_append" >> ~/.zshrc

# Apply changes to current shell
source ~/.zshrc
```

4. Install xz (required for installing certain Python versions via pyenv)

```shell
brew install xz
```

5. Install required Python versions

```shell
# these are examples, adjust to your needs
pyenv install 3.12.2
pyenv install 3.11.8
pyenv install 3.10.13
```

6. Upgrade pip for each installed Python version

```shell
# these are examples, adjust to your needs

pyenv local 3.12.2
pip install --upgrade pip

pyenv local 3.11.8
pip install --upgrade pip

pyenv local 3.10.13
pip install --upgrade pip
```

7. Set a global Python version

```shell
pyenv global 3.12.2
```

## Set Up and Run a Python Project

### Typical Project Structure

```
my_project/
├── .gitignore             # Ignore at least venv/  
├── venv/                  # Virtual environment
├── src/                   # Source code
│   ├── __init__.py        # Makes src/ a package
│   └── main.py            # Entry point
├── tests/                 # Test files
│   └── test_main.py
├── requirements.txt       # Dependency specifications
└── README.md              # Project documentation
``` 

### The Python Virtual Environment

The Python virtual environment (VE) partially plays the role of a dependency manager. It allows you to specify the versions of Python and packages for an individual project. This is needed if the project (including open-source ML models it might use) has specific version requirements, which is often the case, so using a VE is common.

### Typical Setup Steps

1. enter the project folder (git repo)
2. set local python version: `pyenv local 3.13.2`
3. create virtual environment (VE): `python -m venv venv`
4. make git ignore the VE: `echo "venv/" >> .gitignore`
5. activate (enter) VE: `source venv/bin/activate`
6. update pip: `pip install --upgrade pip`
7. install packages
    - if requirements.txt exists: `pip install -r requirements.txt`
        - install packages: `pip install -r requirements.txt`
    - if requirements.txt doesn't exist:
        - install packages: `pip install -r package1 package2 package3`
        - create requirements.txt: `pip freeze > requirements.txt`
8. deactivate (leave) the VE: `deactivate`

### Running Python Code

1. activate (enter) the VE: `source venv/bin/activate`
2. run code: `python my_script.py`
3. deactivate (leave) the VE: `deactivate`