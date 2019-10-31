function root = secant(fname,x0, x1, xtol, ftol, nmax, display)
%SECANT by @maysamdunn
%This function finds the root of the function fname using secant method
%   shows each step (if display is on(ie = 1) and outputs the approx-root
%input: fname is the function's name (string)
%       x0, x1 are the interval [x0,x1]
%       xtol and ftol are the termination tolerance
%       display =   1 if step by step display is desired
%                   0
%output:    root is the computed root of f(x)=0

n=0;
fx1= feval(fname,x1);

if display
    disp('   n            x                     f(x)')
    disp('-----------------------------------------------------')
    fprintf('%4d %23.15e %23.15e\n' , n , x1, fx1)
end

if abs(fx1) <= xtol
    root = x1;
    return
end

for n = 1:nmax
    
    fx0 = feval(fname,x0);
    d = ((x1-x0)*fx1)/(fx1-fx0);
    x0 = x1;
    x1 = x1-d;
    fx1 = feval(fname,x1);
    
    if display
        fprintf('%4d %23.15e %23.15e\n', n,x1,fx1)
    end
    if abs(d) <= xtol || abs(fx1) <= ftol
        root = x1;
        return
    end
end


