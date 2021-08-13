% ENGGEN 131
% MATLAB Julia Sets Project
% Author : Aashish Singh
% UPI : asin819

% This function takes a given file that has a colour name followed by the
% RGB values of that colour, expressed as percentages between 0 and 1. It
% will process that data into two arrays, one that gives all the names for
% the colours present in the file, and the other array, as numerical values
% of RGB as percentages between 0 and 1 of those colours repsectively.


function [colour, values] = ReadColourValues(fileName)

% Opening the file, assigning it a file id and if the file id is not
% correct arising due to wrong file name, an error will be displayed.
fid = fopen(fileName,'r');
if fid == -1
    fprintf(2,'Error opening file %s \n',fileName);
    
else
    % The first following block has a counter, and some empty arrays we
    % will use for temporary storage of data. The block following it
    % declares our output arrays as empty arrays, to be filled later.
    i = 1;
    tempChar = [];
    tempWord = '';
    tempValues = [];
    
    colour = {};
    values = [];
    
    line = fgetl(fid);
    
    % The reason for using an expression not equal to 1, when fgetl
    % gets to the line after the last line in the file, it returns a
    % value of -1 which arises problems with sscanf
    while line ~= -1
        scanValues = sscanf(line,'%s %f %f %f');
        
        % After running sscanf on the current line, we get an array
        % of values, the starting which are all between 97 and 122
        % which implies that the strings have been stored as their
        % character values. Hence we can use our temporary arrays
        % to store the values for words and for mumbers in seperate
        % arrays
        for a=1:length(scanValues)
            if scanValues(a)>96
                tempChar = [tempChar, scanValues(a)];
            else
                tempValues = [tempValues, scanValues(a)];
            end
        end
        
        % In this next loop we convert our character values into
        % the characters they represent, storing the word in
        % another temporary variable.
        for b=1:length(tempChar)
            tempWord(b) = char(tempChar(b));
        end
        
        % Now we dump all our values from our temporary variables
        % and arrays into the output arrays.
        values = [values; tempValues];
        colour{i,1} = tempWord;
        
        % Here we clear the values of our temporary arrays and
        % variable so it can be used freshly again in the next run
        % of this while loop.
        tempWord = '';
        tempChar = [];
        tempValues = [];
        i = i + 1;
        line = fgetl(fid);
    end
    fclose(fid);
end
end
