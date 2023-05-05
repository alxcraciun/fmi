# Laborator 9

## SOLID

- S = Single Responsability
- O = Open-Closed (open for extension, closed for modification)
- L = Liskov Substitution (functions that use pointers to base classes must be able to use objects of derived classes without knowing it)
- I = Interface Segregation (do not inherit if you don't use anything)
- D = Dependency Inversion (depend upon abstract classes, not concrete classes)

Concrete classes do not have a V-Table. <br>
Do not inherit from concrete clasess

<br>

## Explicit Constructor

``` c++
Class MyInt {
    int m_value;
public:
    MyInt(int value){}

    getValue() const {
        return m_value;
    }
}

void dosomething(MyInt myInt) {
    std::cout << myInt.getValue() << std::endl;
}

int main() {
    doSomething(42);
    return 0;
}

```

<br>

## Templates

- template-urile sunt initializate in memorie abia cand sunt initializate
- template-ul iti da erori in functie de ce apelezi 

``` cpp
template <typename T>
T functie(T param)

// acelasi lucru cu

template <class T>
T functie(T param)
```

- Use `.cpp.h` when you have C-code
- Use `.hpp` when you only have CPP-code
- Use `include<.cpp.h>` at the end of the file 

<br>