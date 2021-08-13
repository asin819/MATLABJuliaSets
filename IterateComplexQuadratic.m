% ENGGEN 131
% MATLAB Julia Sets Project
% Author : Aashish Singh
% UPI : asin819

% This function takes 3 inputs, an initial complex number, a constant
% values that too is expressed in an complex number and a cutoff value. The
% function takes the value of z and feeds it in another function, f(z) =
% z^2 + c, while taking the mod of that value of z. This happens again and
% again until we reach our cutoff value or we reach the radius, which is 3,
% hence the modulus of z must be less than 3.

% If we reach mod of z > 3 before reaching the cutoff value, the output is
% the number of iterations it took to get there. If we reach the cutoff
% value, then our output is zero.


function [iterations] = IterateComplexQuadratic(z,c,n)
j = 0;
modz = abs(z);

% Before passing it through f(z) we check if the supplied value of z is
% greater than 3 or not
if modz>3
    iterations = 0;
else
    
    % Here we intend to run the main part of the code or the function that
    % changes the value of z, only under two conditions that need to be
    % both true, which is the absolute value of z less than 3 and our
    % number of iterations till the cutoff value.
    
    while modz < 3 && j<n
        j = j +1;
        z = z^2 +c;
        modz = abs(z);
    end
    
end

% If our final value of modz on the last iteration is greater than 3, j
% is the number of iterations. However if not, moving to the next
% conditional block, if we reach the cutoff value, we return a value of
% 0 else the value of j again.
if modz > 3
    iterations = j;
else
    if j == n
        iterations = 0;
    else
        iterations = j;
    end
end
end