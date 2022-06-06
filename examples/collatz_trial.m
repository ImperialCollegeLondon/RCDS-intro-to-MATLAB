% Collatz conjecture trial 
% This script is for print all sequences of numbers
% of Collatz conjecture given initial numbers from 
% 1 to 10 using for loop

% Liam 2022

%{
This is for block comments if there are multiple 
lines of comments
%}

n = 10;
for i = 1:n
    fprintf('Printing Collatz conjecture for %i \n', i);
    collatz_conjecture(i);
end
