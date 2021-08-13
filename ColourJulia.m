% ENGGEN 131 
% MATLAB Julia Sets Project
% Author : Aashish Singh
% UPI : asin819

% This function takes an array that inclues points that are and also not in
% julia sets, processed by our JuliaSetPoints function and converts it into
% a uint8 array, that can be used to display an image.

% If the value of the point in the array is 0, it will be replaced by a
% black pixel i.e RGB values of 0,0,0. However if not, the value(x) will be
% replaced the xth row of the colour map, which will have its corresponding
% RGB values.

% There are two inputs, the array and our desired colourmap. The number of 
% rows used for the colourmap are the same as our cutoff value used during
% IterateComplexQuadratic. A single output of an array of values of type
% uint8 is given.


function [uint8Array] = ColourJulia(inputGrid,colourMap)

% We find out the characteristics of the input grid, and also preallocate
% our output grid to all zeros, to save time. 
[rows, cols] = size(inputGrid);
outputTemp = zeros(rows,cols);

for i=1:rows
    for j=1:cols
        inputValue = inputGrid(i,j);
        % If the current value of the element we are at is not zero, i.e it
        % wont be represented by a black pixel, we replace the zeros in the
        % output grid in the same position by the required RGB values. The
        % values we do get are between 0 and 1, and then are converted into
        % equivalent values between 0 and 255
        if inputValue~=0
            outputTemp(i,j,1) = (colourMap(inputValue,1))*255;
            outputTemp(i,j,2) = (colourMap(inputValue,2))*255;
            outputTemp(i,j,3) = (colourMap(inputValue,3))*255;                        
            % The reason for laying the above three lines instead of using
            % 1:3 is due to faster processing, both results which were
            % compared during testing.
        end
    end
end

% The array we now have contain values that are of the data type
% double, here we convert them into the required uint8 values.
uint8Array = uint8(outputTemp);
end