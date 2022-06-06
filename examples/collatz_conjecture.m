% Liam
% Collatz Conjecture

function collatz_conjecture(n)
    disp(n);
    while n~=1
        n = collatz_function(n);
        disp(n);
    end

end