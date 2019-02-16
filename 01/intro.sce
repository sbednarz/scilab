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


