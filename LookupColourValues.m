% ENGGEN 131
% MATLAB Julia Sets Project
% Author : Aashish Singh
% UPI : asin819

% This function takes 3 input values, the colour we want to look up for, a
% cell array of present colours and their respective values in another
% array. The latter two should be obtained from calling the ReadColourValues
% function on the provided text files.

function [outValues] = LookupColourValues(colour,colours,values)

% Here we will search for the required colour in each index value of
% the colours array. For a match, it will take that specific index and
% run that index in the array that holds the RGB values, which will be
% our output array.

colourPresent = 0;
for i=1:length(colours)
    if strcmpi(colours(i),colour) ==1
        outValues = values(i,1:3);
        colourPresent = 1;
    end
end

% If we search for a colour that is not present in our list of colours,
% it will return an array of zeroes with an error message that the
% colour was not found.

if colourPresent~=1
    fprintf(2,'Colour not found \n');
    outValues = [0 0 0];
end
end