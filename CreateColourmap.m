% ENGGEN 131 
% MATLAB Julia Sets Project
% Author : Aashish Singh
% UPI : asin819
% Date created : 14 September 2020

% This function takes three arguments, an initial RGB value, an ending RGB
% value and the number of rows the transition from the start to the end
% will be linearly spaced over. In the end it will give out a single array
% of specified rows, each row transitioning from a starting red, green and
% blue value to the intended final ones.


function [OutArray] = CreateColourmap(startColour, endColour, nRows)
    
% The followng three lines pick the starting red, green and blue values
% respectively and creates an array, transitioning then with even
% spancing, decided by the number of rows required.
redValues = linspace(startColour(1),endColour(1),nRows);
greenValues = linspace(startColour(2),endColour(2),nRows);
blueValues = linspace(startColour(3),endColour(3),nRows);

% This next line takes our transitional values of red, green and blue
% and fits them into one single array which is the output of this
% function.
OutArray = [redValues', greenValues', blueValues'];
    
end
