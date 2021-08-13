% ENGGEN 131
% MATLAB Julia Sets Project
% Author : Aashish Singh
% UPI : asin819

% This function takes a grid of complex numbers, takes each value in the
% grid and determines whether if it is part of the julia set or not. If it
% is the value in the grid is replaced by a zero, however if it is not, the
% number of iterations it takes to exit the julia set replaces that value.
% If the iterations exceed the cutoff limit, then too the value is replaced
% with zero.

% The function will have three inputs, the input grid, a constant c which
% is a complex number and the cutoff value for iterations. It returns a
% single array having same dimensions as the input grid but with replaced
% values.

function [processedGrid] = JuliaSetPoints(inputArray,c,nIterations)

% Here we see how many rows and coloumns does the supplied grid have,
% and accordingly process the elements in the grid going from same row
% and moving accross columns, using nested for loops.
processedGrid = [];
[rows, cols] = size(inputArray);

for i=1:rows
    for j=1:cols
        inputValue = inputArray(i,j);
        % We make use of our IterateComplexQuadratic function to
        % determine whether the complex number is a part of the julia
        % set or not and whether it passes the cutoff or not.
        outputValue = IterateComplexQuadratic(inputValue,c,nIterations);
        processedGrid(i,j) = outputValue;
    end
end
end