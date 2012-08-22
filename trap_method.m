%Trap function
function int = trap_method(x,y)
%{
This function integrates f(x)dx given two equally sized vectors that 
correspon with x and f(x) data points. Inputs must be equally 
spaced, contain at least tree points for analysis, be the same length, 
and must have dimensions 1xn. This is a trapezoidal numerical integration 
estimation.
%}

%Check for correctly sized input
sizX = size(x);
sizY = size(y);

if sizX(1)~=1 || sizY(1)~=1    %Check for 1xn vector
    error('Both arguments must be 1xn vectors.')
else
end

if sizX(2)<=3 || sizY(2)<=3    %Check for acceptable # of data points
    error('Vectors must have at least three points of analysis.')
else
end

if sizX(2)~=sizY(2)    %Check for equal size
    error('Vectors must have equal lengths.')
else
end

n = 1;    %Check for equal spacing
while n<sizX(2)-1
    spacing(n) = x(n+1)-x(n);
    if n>1
        if spacing(n)~=spacing(n-1)
            error('Vectors must be equally spaced')
        else
        end
    else
    end
    n = n+1;
end

%Compute integral
spc = x(2)-x(1);
n = 2;
int = 0;
while n<=sizX(2)
    trapn = spc*((y(n)+y(n-1))/2);
    int = int+trapn;
    n = n+1;
end