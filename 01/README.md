
---

### Computer Modelling in Chemical Technology: Scilab worked examples

#### Module 1. Scilab Introduction

[Example 1.1 Intro](#example-11-intro) | 
[Example 1.2 Functions](#example-12-functions) | 
[Example 1.3 Reporting](#example-13-reporting) | 
[Example 1.4 Ploting](#example-14-ploting) | 
[Example 1.5 Loops](#example-15-loops) | 
[Example 1.6 fsolve](#example-16-fsolve)

---


##### Example 1.1 Intro

```scilab
// intro

// two slashes == comment (not interpreted by Scilab)
// http://www.scilab.org/download/
// version >= 6.0


// Scilab console
// press TAB key to see hints
// use up/down arrows to walk through your command history
// in any time: help topic/function ;)

2+2
4+4
log(10)
log10(10)
20/(log(2**2+5))


// integers
100
-123

// floats
12.45
-3.3333333
1.34e5


// user defined variables

a = 3
pH = 7.5
H = 1.4e-5 // scientific notation
a_long_name_variable = 555


// calculations
a = 10
b = 100
cp = a/b*100

// true - false
2>5
5==5


// a row vector (comma)
v1=[1, 2, 3, 4]

// a column vector (semicolon)
// think: semicolon ends a row
v2=[1; 2; 3; 4]

// transposition
v1'
v2'


// a range
1:10
1:0.5:10

// creation a vector by filling with a range
v3=[1:1:10]
v3

// a matrix
m1=[1,2,3; 4,5,6]

// first element has index 1 (NOT 0)
// accessing vectors & matrices elements by indexes
v3(2)
m1(1,1)
m1(2,2)
m1(1,1) + m1(2,2)

// slices of vectors & matrices
m1(1:2,1:2)
m1(:,2)
m1(:,:)

// 
linspace(1,2,5)

// help linspace


// default - operations element by element

x=[1, 2, 3, 4, 5, 6, 7]
y=2*x
y2=4*x**2+4*x+10

// mathematical constants

%pi
%e


```

##### Example 1.2 Functions

```scilab

// fun1 => a function name
// y => return value

function y = fun1 (x)
	y = x + 2
endfunction


// using of functions

a = 10
b = fun1(a)
disp(b)

disp(fun1(10))


function y = fun2 (x)
	z = x**2
	y = z + 1
endfunction

disp(fun2(10))
// 101


// function of two arguments
function z = calculate(x,y)
	z = x+y
endfunction

disp(calculate(10,20))
//30




// vectors & matrices as functions arguments/results
function y = fun3 (x)
	a = x(1)
	b = x(2)
	y(1) = a+b
	y(2) = a-b
endfunction

v = [10,2]
q = fun3(v)

// q is a vector

disp(fun3(v))
// 12
// 8



```

##### Example 1.3 Reporting

```scilab
//1
disp(2+2)

//2
var1 = 1992
disp(var)

//3
disp('a string')


var2 = 1992.45

printf('Value of var1 is %0.2f \n', var2)
printf('Value of var1 is %0.2e \n', var2)
printf('Value of var1 is %0.5f \n', var2)
printf('Value of var1 is %0.5e \n', var2)
printf('Value of var1 is %0.1f \n', var2)
printf('Value of var1 is %0.1e \n', var2)

```

##### Example 1.4 Ploting

```scilab

// 1
// some data
x = [1,2,3,4,5]
y = [2,4,6,8,10]

plot (x,y)

// clear 
clf


// 2
// some data
x = [1,2,3,4,5]
y = [2,4,6,8,10]

// try different arg: 'o' '-' 'o-' 'x' 'r' 'g' 'b' 'y'
plot (x,y,'o')

//
clf


// 3

// 0...10 (100 elements)
// try disp(x)
x = linspace(0,10)
y1 =  3*x**2 - 10*x + 1
y2 =  -3*x**2 - 10*x + 1
plot(x,y1,'.r')
plot(x,y2,'.g')
xlabel("X-axis");
ylabel("Y-axis");



// 4
// data in a matrix

m = [1,1; 2,4; 3,9; 4,16; 5,25]

//the matrix
disp(m)

//first column
disp(m(:,1))

//second column
disp(m(:,1))

clf
plot( m(:,1), m(:,2), '*r')

```

##### Example 1.5 Loops

```scilab
// loops

// from 1 to 10
for x = 1:10
    disp(x)
end

// start : step : end
for x = 1:2:10
    disp(x)
end

for x = 10:-1:1
    disp(x)
end


// iteration through values of a list (a vector)

mylist = [1, 2, 55, 67, -4, 33.333]
for x = mylist
    disp(x)
end



// nested loops

for x = 1:1:3                         // 1, 2, 3 (three times)
    for y = 2:5                       // 2, 3, 4, 5 (four times)
        printf( "x=%f y=%f \n", x, y) // 3x4 = 12 times
    end
end


```

##### Example 1.6 fsolve

```scilab
// fsolve



// The “fsolve” function solves systems of n nonlinear equations and
// n unknowns.




// lets solve an equation:
// -2*x**3 + 5*x**2 + x = 2


// todo: plot eq x=<-1,3>
// Where are roots approx?



function y = problem(x)

    y = -2*x**3 + 5*x**2 + x - 2            // note the form: -2*x**3 + 5*x**2 + x - 2 = 0

endfunction


// a guess value: try 2000, 100, 10, 1, -1, -100
x0 = 10

// main calculations
solution = fsolve(x0, problem)

// a minimalistic report
disp(solution)






// lets solve a system of 2 equations and 2 unknowns:
// {p+q=10, p**2-q=4}


// all expression on left side, 0 on right side
// {p+q-10=0, p**2-q-4=0}


// todo: plot eq p=<-10,10>


function eq = problem(x)
    p = x(1)
    q = x(2)
    eq(1) = p+q-10
    eq(2) = p**2-q-4
endfunction


// guess values try different pairs
guess = [1; 1] // semicolon here (NOT comma)

// main calculations
solution = fsolve(guess, problem)

// a minimalistic report
disp(solution)




/* ANS:

   first pair of solutions:

   3.2749172
   6.7250828

  second pair of solutions:

 -4.2749172
  14.274917

*/



```
