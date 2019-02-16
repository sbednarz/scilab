
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



