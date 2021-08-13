% ENGGEN 131
% MATLAB Julia Sets Project
% Author : Aashish Singh
% UPI : asin819
% Date created : 15 September 2020

% This function takes a single input, n, which creates a grid of values of
% n rows and coloumns. The y axis represents the imaginary value of the
% complex number while the x axis represents the real value. The values are
% bounded in a region, with the points on the corner of the grids being
%   -2+2i       2+2i
%
%   -2-2i       2-2i
%
% The other points generated in the grid, depending on the value of n, will
% be equally spaced.


function [gridOut] = CreateComplexGrid(n)

% Here we create, one temporary grid and the top and bottom rows of the
% grid, with linearly spaced points using linspace.
gridTemp = [];
xtop = linspace(-2+2i,2+2i,n);
xbottom = linspace(-2-2i,2-2i,n);

% Using the top and bottom rows we start filling values coloumn wise
% and store them all in a single row array.
for i=1:length(xtop)
    gridTemp = [gridTemp,linspace(xtop(i),xbottom(i),n)];
end


% We take our temporary grid and sort it out accordingly into our
% inteneded square grid of n rows and coloumns.
j = 1;
for k=1:n
    for m=1:n
        gridOut(m,k) = gridTemp(j);
        j = j+1;
    end
end
end
