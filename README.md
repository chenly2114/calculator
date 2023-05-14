## Here is a simple calculator using Bision in C++.

### To compile and run the calculator, you need to have Bison and Flex installed on your system. Run the following commands:

```
flex -o calculator.yy.cpp calculator.l
bison -d -o calculator.tab.cpp calculator.y
g++ -o calculator calculator.tab.cpp calculator.yy.cpp
./calculator
```