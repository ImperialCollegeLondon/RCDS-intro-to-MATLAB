% Liam
% function of Collatz 

function y = collatz_function(n)
    if mod(n,2) ==0 
        y = n/2;
    else
        y = 3*n+1;
    end
end