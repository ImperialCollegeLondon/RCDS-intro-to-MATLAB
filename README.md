# CM Hub: Introduction to MATLAB
Introduction to MATLAB course for the CM Hub at Imperial College

3 × 2 hour classes

* **Part 1:** Call-and-response MATLAB, basic arithmetic, simple scripts
* **Part 2:** 2D/3D plots, functions, Collatz conjecture
* **Part 3:** if, loops (for, while), Data analysis

## The Graduate School logo
<img src="/readme-images/grad-school-logo.png">

## On completion of this workshop you will be able to:
* use MATLAB to run scripts,
* apply fundamental components of the MATLAB language including variables, loops, conditionals and functions,
* create programs to solve simple problems,
* interpret common errors and use these to help debug a program.

## Prerequisites
* No programming experience is required
* Students are welcome to bring their own fully charged laptops to these sessions although there are computers in situ.
* If on a laptop, please [install MATLAB](https://www.imperial.ac.uk/admin-services/ict/self-service/computers-printing/devices-and-software/get-software/get-software-for-students/matlab/) and install [Symbolic Toolbox](https://uk.mathworks.com/matlabcentral/answers/242196-how-to-install-new-toolbox).
* Alternatively, you can use MATLAB online at [https://matlab.mathworks.com/](https://matlab.mathworks.com/) after registering and activating your account with your university/college email.

## YouTube videos for distance learning
Timestamps are in the descriptions and correspond to the numbering in this document.
* [Part 1](https://www.youtube.com/watch?v=fsRui3gaOuc)
* [Part 2](https://www.youtube.com/watch?v=HWEWnaV7Xec)
* [Part 3](https://www.youtube.com/watch?v=JNvfPRTEbAg)
* [Playlist](https://www.youtube.com/playlist?list=PLcRp2oAQBugsErP-wF-tpZUUm8mLg-ME_)

## Part 1. Call-and-response MATLAB, basic arithmetic, simple scripts

### 1. Where MATLAB sits among other languages
<img src="/readme-images/maths-not-maths-languages.png" width="50%">

Pros of MATLAB:
* Shallow learning curve for maths
* Comes with a lot of useful baked-in tools
* Interactivity/debugging is quite easy
* Backwards compatible and has been around for a long time
* Excellent systematic help documents

Cons of MATLAB:
* Ideosyncratic
* £££££££££££
* Bad for programming in general
* Isn't used outside of universities
* Plays badly with other languages

In short: Matlab is a good plug-and-play language for medium-sized maths problems.

### 2. Awareness of the MATLAB desktop environment
* The command window allows for call-and-response interface

### 3. Command-line arithmetic

Join in:

* `3+4`
* `3*4`
* `3/4`
* `3^4`

Try:

* Does Matlab respect BIDMAS?: `(3+4)*5`,`3^4*5`,`3+4/5`, `3+4*5`, `3-4*5`

### 4. Use of variables

Join in:

* `x=2`
* `x`
* `x=-9`
* `x`
* `width = 3` (long names are good)
* `area = width^2`
* `y=12/2+5`
* `(y+1)^2`
* `y=sin(x)*cos(x)`

**Valid Names**

A valid variable name starts with a letter, followed by letters, digits, or underscores. MATLAB® is case sensitive, so A and a are not the same variable.

The maximum length of a variable name is the value that the namelengthmax command returns.

You cannot define variables with the same names as MATLAB keywords, such as if or end. For a complete list, run the iskeyword command.


| Examples of valid names:  | Examples of invalid names: |
| ------------- | ------------- |
| x6  | 6x  |
| lastValue  | end  |
| n_factorial  | n!  |




**Conflicts with Function Names**

Avoid creating variables with the same name as a function (such as i, j, mode, char, size, and path).

In general, variable names take precedence over function names. If you create a variable that uses the name of a function, you sometimes get unexpected results.

Check whether a proposed name is already in use with the exist or which function. exist returns 0 if there are no existing variables, functions, or other artifacts

with the proposed name.

For example:

`exist checkname`

If you inadvertently create a variable with a name conflict, remove the variable from memory with the clear function (clear will remove all variables from your workspace).

You can right click to delete one variable a time in the Workspace window.

Another potential source of name conflicts occurs when you define a function that calls load or eval (or similar functions) to add variables to the workspace. In some cases, 

load or eval add variables that have the same names as functions. Unless these variables are in the function workspace before the call to load or eval, the MATLAB parser interprets the variable names as function names. 



**A bit challenge**

Try:

 Symbolic variables (if the following line runs into errors, please install Symbolic Toolbox). [Symbolic Toolbox](https://uk.mathworks.com/matlabcentral/answers/242196-how-to-install-new-toolbox)

 syms a b x y

together with

* simplify the following equations

 x^2+2*a*x+a^2 

 8*x - y - 2*x + 3*y

sin(x)*sin(x)+cos(x)*cos(x)

* expand the following equations

(y+2)*(y+1)

(x-3)^3

(a*x+3)*(b*x-2)

* evaluate a function

A = [x x^3; x^2 x^4];

f(x) = A

f(2)

* solve an equation

eqn = (x+y)^2 == 4;

% solve the equation on x

sol = solve(eqn, x)
 
### 5. Getting help

* Find square root of x: Google the function
* Or use F1 on the function
* Or use ChatGPT (or similar AIs)

Try:

* Find sin<sup>–1</sup>(1)
* Find the remainder when 14 is divided by 3 (challenge: find the difference between 2 methods)
* Find |–4|

### 6. The semicolon

Try:

* What's the difference between `x=40` and `x=40;` ?

### 7. Creating vectors and matrices

The building block of Matlab is the *matrix*. These can represent lists, data tables, or matrices as mathematical objects.

Join in:

* `x = [29 43 13 3.2 -26]`
* `y = [1 2; 3 4]`
* `[1:10]` (note endpoints)
* `[1:2:10]`
* `[3:-0.1:2]`

Try:

* What do apostrophes do? `x'` `y'`
  * NOTE: `x` and `y` are real matrices. If `x` and `y` are complex matrix, `.'` should be used (Thanks to Yuliang Zhu from EEE). There are more examples can be found [here](https://uk.mathworks.com/help/matlab/ref/transpose.html)
* What do commas do?: `[29, 43, 13, 3.2, -26]`
* How long is `[1:0.5:10]`?

### 8. Matrix manipulation

Join in:

* `x = [3 1 4 1 5 9]`
* `x(2)`
* `x(4) = 50`
* `x`
* `y = [3 10; -1 6]`
* `y(1,2) = 100`
* `y`
* `A = [1:10]'*[1:10]` (explanation later)
* `A(4, [1 2])`
* `A([8 9],[8 9])`
* `A(3,4:end)`
* `A(1:end,4)`
* `A(:,4)`
* `sum(A(:,4))`: `sum` sums the columns

Try:

* Create the matrix `A = magic(5)` (explanation later)
* Get the element in the 1st row, 1st column
* Get the element in the 5th row, 2nd column
* Get all elements in the last row
* Get the element in the 6th row, 4th column (...)
* What does `A([2 1 1 1],4)` do? Try it.

Now try:

* Show that the `sum` of the first column of `A` = the `sum` of the last column of `A`
* Find the `sum` of the diagonal of `A` (hint: search for the function that gives the diagonal of `A`... or guess!)
* Harder! Find the `sum` of the '/'-leaning diagonal of `A`. Hint: try showing the rows of `A` in reverse before using `diag`
* Harder! Produce the elements of `A` for which both coordinates are odd
* Replace the bottom row of `A` with zeros

### 9. Vector arithmetic

Join in:

* `x = [1:10]`
* `y = [11:20]`
* `x+y`
* `x-y`
* `2*x`
* `x/2`
* `x*y`... what do you expect to happen? Why is this problematic but `x+x` isn't? (Hint: think about matrices)
* `x.*y`
* `x.^2`
* `2.^x`

Try:

* `sum` the numbers from 1 to 100 (are you faster than Gauss?)
* `sum` the squares from 1 to 5
* What is the mean of the powers of 2 from the zeroth power to the sixth power? (Google the function to find the mean... or guess!)

### 10. Writing simple scripts

A script is the simplest type of Matlab program.

Join in:

* Create a script `magic_square_test.m`
* Let's see if switching the top and bottom row of a magic square keeps it a magic square:
```
n = 4; % matrix size
M = magic(n);
top_row = M(1,:);
bottom_row = M(end,:);
M(1,:) = bottom_row;
M(end,:) = top_row;
disp(sum(M)); % to display we can use 'disp' or just leave off the semicolon
disp(sum(diag(M)));
disp(n*(n^2+1)/2); % magic constant
```
* Run the script.
* Breakpoints
* Change the script so that we do it with a matrix of size 3 instead.
* NOTE: % is for a line of comment. For block comments, use %{   %}

#### Repeat above lines in Live Scripts (code + text)

## Part 2. Plotting, functions, Collatz conjecture

### 1. Plotting in 2D

Join in, putting this in a script, `first_plot.m`:

* `x = [0:10]`
* `y = exp(x)`
* `plot(x,y)`
* How do we make this graph smoother?

Try:

* `plot` sin(*x*) for *x* between 0 and 2π
* `plot` a circle: recall *x* = cos(*θ*), *y* = sin(*θ*) for *θ* between 0 and 2π to make a circle with radius 1.

Join in:

* `x = [0:0.1:10]`
* `y = exp(x)`
* `plot(x,y,'r-')`
* Change to: `plot(x,y,'go')`

Try:

* Plot a magenta, dotted line with large line width and squares as markers. (Look at the F1 help file for `plot`)

Join in:

* `xlabel('x')`
* `ylabel('exp(x)')`
* `title('Exponential growth is fast')`
* `xlim([0 5])`
* Now let's try multiple plots
* `x = [0:0.1:10]`
* `y1 = exp(x)`
* `y2 = exp(0.9*x)`
* `plot(x,y1,'r-')`
* `hold on`
* `plot(x,y2,'k--')`
* `legend('exp(x)','exp(0.9x)')`

Try:

* The same but use `loglog`, `semilogx` or `semilogy` instead of `plot` (the syntax is the same). What do they do?
* Try in the Live Scripts too.

NOTE:
* For multiple plots in multiple figure windows, please use `figure()`.

### 2. Plotting in 3D

Join in:

* `t = [0:0.1:10];`
* `x = sin(t);`
* `y = cos(t);`
* `z = t;`
* `plot3(x,y,z)`
* `grid on`

Visualise *f*(*x,y*) = sin(*x*)cos(2*y*) for 0 ≤ *x,y* ≤ 2π:

* Create grid
  - `x = linspace(0,2*pi,300)`
  - `y = linspace(0,2*pi,300)`
  - `[xg,yg] = meshgrid(x,y);`
* `f = sin(xg).*cos(2*yg);`
* `contour(xg,yg,f,20);`
* `surf(x,y,f)`
* `shading interp`

Try:

* Try in the Live Scripts too.

### 3. Writing and calling simple functions
Now we move from simple call-and-response to writing whole programs

* Difference between scripts and functions.
* Let's do functions first.

Join in:

* Create a new file `collatz_function.m` and inside it write:
```
function y = collatz_function(n)
  y = 3*n+1;
end
```
* Save and run `collatz_function(5)` from the command line

Try:

* Create a function `first_and_last` which takes a vector `v` and returns the first element in the vector and the last element in the vector
* Test it out in the command line, letting `test_vector=[1:10]` and running `first_and_last(test_vector)`.

Join in:

* Change `first_and_last` so it outputs the first and last elements separately
* Test it out 1:
  - `[first, last] = first_and_last(v)`
  - `first = `
  - `last = `
* Test it out 2:
  - `[least, middle, largest] = lml(v)`
  - hint: work out the values; use `median` for middle.

## Part 3. if, loops (for, while),  Data analysis

### 1. if

Join in:

* Create a function `function y = sign_function(x)` so that the core functionality reads:
```
if x > 0
  y = 1;
elseif x == 0
  y = 0;
else
  y = -1;
end
```
* Note: `==` is not `=`

Try:

* Change `collatz_function(n)` so that if *n* is even, it returns *n*/2, otherwise it returns 3*n*+1.


### 2. For and while loops

Join in:

* Create a new script `squares_up_to.m`. Inside let's write
```
n = 10;
for i=1:n
  disp(i^2); % this squares i and then displays it on the screen
end
```
* Run the script

Try:

* Change the script to display the first 10 odd cubes.

Join in:

* Create a new function `count_up_to.m`. Inside let's write
```
function count_up_to(n)
  i = 1;
  disp(i);
  while i < n
    i = i + 1;
    disp(i);
  end
end
```

Try:

* **The Collatz conjecture:**
  * The [Collatz conjecture](https://en.wikipedia.org/wiki/Collatz_conjecture) is a famous mathematical conjecture about a sequence which starts with a positive integer `n`. The next term in the sequence is given by `collatz_function(n)`. The conjecture says that this sequence will always reach the number 1 (where it ends).
  * For example, the sequence for `n=5` is 5, 16, 8, 4, 2, 1.
  * Your job is to create a new function, `collatz_conjecture(n)`, which takes a starting number `n` and displays the terms in the sequence.
  * Take a moment to think about the logic you need!
  * Suggested method: Use a `while` loop inside the function `collatz_conjecture(n)`. While `n` does not equal 1, run `collatz_function(n)` to get the next term in the sequence.
  * "Not equal to" is `~=` in Matlab.
  * Hint 1: You have to let the output of `collatz_function(n)` become the input of the function the next time round.
  * Hint 2: You have to change the value of `n` within your while loop otherwise `n` will never equal 1.

* For the keen: Write a script, `collatz_trials.m` which loops through the numbers 1 to 10, printing out the Collatz path every time.

* **Challenge:**
  - Error message
  - Test input arguments

### 3. Data analysis: reading and saving data

There are lots of ways of saving and reading data in MATLAB. A good question to ask is 'do I want to open the saved data in another program?'

Join in:

* Download the file [exchange_rates.csv](https://github.com/73764dce-9037-4750-8659-e99047d05be3)
* Move the CSV file to your folder
* Have a look at this file in Excel
* Create a new script, `exchange_rate_data.m`
* `data = readmatrix('exchange_rates.csv');`

Your turn:

* Plot the GBP/USD price (12th column) against the day of the year (1st column)
* On the same graph, plot the EUR/USD price (11th column) against the day of the year
* On a new graph, plot the EUR/GBP price against the day of the year. ~~Can you guess which year this data is from?~~
* What was the minimum number of euros you could buy with £1 that year?
* On which day of the year was this the case? (Hint: look up `min` in the help files)

Join in:

* Create another data matrix, `data_pounds`, which contains the exchange rate of these currencies versus GBP, instead of USD
* Save the `data_pounds` data matrix
* `writematrix('exchange_rates_pounds.csv',data_pounds)`
* Look at it in Excel

Advanced:

* Observe and find Cons with `readmatrix` and  `writematrix`
* Solution:
  * Use `readtable` and `writetable` instead
  * example:

```
exchange_data = readtable('exchange_rates.csv');

header = exchange_data.Properties.VariableNames;

exchange_data_wo_header = table2array(exchange_data);

data_pounds = exchange_data_wo_header;

GBP_USD = exchange_data_wo_header(:,12);

data_pounds(:,2:end) = exchange_data_wo_header(:,2:end)./GBP_USD;

new_table = array2table(data_pounds, 'VariableNames', header);

writetable(new_table, 'exchange_rates_GBP.csv');
```

* Your research: fopen, textscan, fclose



# Feedback form
If you're taking this course through the Graduate School, please fill out [the feedback form](https://tinyurl.com/feedback-rcds22-23).




# Extra stuff

### X1. Linear algebra: Matrix arithmetic

Join in:

* `A = [1 0 5; 2 1 6; 3 4 0]`
* `A.^2`
* `A^2`

Try:

* Create a 2x3 matrix, call it `B`
* Create a 3x4 matrix, call it `C`
* Try calculating `B*C` and `C*B`
* Multiply `B` by the transpose of `B`
* Make one of the elements of `B` imaginary (`i`)
* Calculate `B'`. What does the apostrophe *actually* do?

### X2. Linear algebra: Inversion of matrices (and when this is a bad idea)

Join in:

* `A = [1 0 5; 2 1 6; 3 4 0]`
* `A`
* `inv(A)`
* Let's solve *Ax* = (–1 0 1)<sup>T</sup>
* `b = [-1; 0; 1]`
* If *Ax* = *b* then *x* = *A*<sup>–1</sup>*b*, so `inv(A)*b`
* `A\b`

Try:

* Solve the system of equations *x*+*y*=2, -*x*+3*y*=3.
* Let `A = [1 2 3; 4 5 6; 5 7 9]` and `b = [-1; 0; 1]`. Solve *Ax=b*. What is the determinant of *A*? (Google!)



### X3. Size

Size gives rows × columns

* `size(A)`
* `size(B)`
* `x = [1:10]`
* `size(x)` ... note it's 1×10 (a row vector), not 10×1 (a column vectors).

Vectors by default are row vectors in Matlab.

### X4. Linear algebra: More matrix arithmetic

Join in:

* `A`
* Let's multiply `A` by (3 1 4)<sup>T</sup>
* `x = [3 1 4]'` (note apostrophe) or `x = [3; 1; 4]` (note semicolons)
* `A*x`

Try:

* Let `x = [3 1 4]` (without the apostrophe). Will calculating `A*x` work? Try it.
* Create the 3×3 identity matrix `I = eye(3)`. Multiply *I* by *x*.

### X4. Eigenvalues and eigenvectors

* `A = [-2 -4 2; -2 1 2; 4 2 5]`
* `eig(A)`

Try:

* How to get eigenvectors? (Google or F1)

### X5. Strings

Single-quote strings are vectors, with each character an element in the vector

Join in:

* `greeting = 'hello there'` (note: single quotes)
* `greeting(3)`
* `[greeting(1:4) greeting(7)]`

Double-quote strings (R2016b upwards only) are individual things. You can create vectors of multiple strings

* `greeting = "hello there"`
* `greeting(3)`
* `greeting(1)`
* `conversation = ["hello there", "general kenobi"]`
* `conversation(2)`

Try:

* Let `surname` equal your surname
* Find the last letter of your surname
* Output the first and last letter of your surname, put together
* If `conversation = ['hello there', 'general kenobi']` (with single quotes), what is `conversation(2)`?

### X6. Built-in functions to try
Try:

* `sin(x)`, `cos(x)`, `tan(x)`
* `floor(x)`, `ceil(x)`
* `max(x)`, `min(x)`
* `triu(A)`, `rand(n)`

### [X7. Curve Fitting](./curve_fitting.md)

### [X8. Numerical Root Finding](./root_finding.md)


# Extra challenges 

### Challenge 1
* Plot the graphs of sin(*ax*), sin(*bx*) and sin(*cx*) for *x* from –π to π, with these plots in different colours. Include a legend, a title and a label for the *x*-axis.

### Challenge 2
* Create a new function `fib.m`. Let this function take a number `n` and output the `n`th Fibonacci number. Recall the algorithm:
  - F(1) = 1
  - F(2) = 1
  - F(i) = F(i-2) + F(i-1)
* Create a vector of the first 20 Fibonacci numbers
* Save them to a file
* Plot them

### Challenge 3
* Create a 10×10 matrix of random numbers (hint: use `rand`) and call it `A`
* Find the eigenvalues of *A*
* Show that the sum of the eigenvalues of *A* = the trace of *A*
* Plot the eigenvalues on an Argand diagram, using a circular marker at each eigenvalue
* Now add a row and column of zeros to *A*, to form *B*, which is therefore an 11×11 matrix. (Think about how you might want to do this!)
* Now plot the eigenvalues of *B* on the same graph as the eigenvalues of *A*, in another colour.
* What can you say about the eigenvalues of *B* compared to the eigenvalues of *A*?

# Licence
This work is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International Licence](http://creativecommons.org/licenses/by-nc-sa/4.0/).
