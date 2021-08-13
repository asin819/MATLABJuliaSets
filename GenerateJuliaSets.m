% ENGGEN 131
% MATLAB Julia Sets Project
% Author : Aashish Singh
% UPI : asin819

% This function takes an array of complex values, which are our different
% fractals, used to generate its corresponding Julia set image.

% The function takes 3 inputs, an array of complex values; n, which
% the number of rows and columbs the grid will have; and the colour map the
% julia set will have, its number of rows in the colour map specified by
% our cutoff values when we run the function to determine the Julia set



function [outCell] = GenerateJuliaSets(complexValues,n,colourMap)

% Here an empty output cell and some temporary arrays have been made,
% alongside getting the cutoff value, as it is the same as the number
% of rows in the colour map array
outCell = {};
tempHolder = [];
colorHolder =[];
[r,c] = size(colourMap);

% Using our grid function to create a grid of n rows and columns
grid = CreateComplexGrid(n);


% We take each element of our provided complex values that are our
% fractals and make their corresponding julia set images, by first
% running it through JuliaSetPoints which determines if the point is in
% the julia set or not and then through ColourJulia, which provides an
% array of rgb values of that julia set, in the data type uint8, which
% will be used to generate the image for that fractal.
for i=1:length(complexValues)
    tempHolder = JuliaSetPoints(grid,complexValues(i),r);
    colorHolder = ColourJulia(tempHolder,colourMap);
    
    
    % We hold the different uint8 arrays as a element in the final
    % output cell, and also clearing the values of our temporary
    % holders so they can be used again.
    outCell{i} = colorHolder;
    tempHolder = [];
    colorHolder =[];
    
end
end
