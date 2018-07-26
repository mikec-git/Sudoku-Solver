function [ noRep ] = NewCheck( puzzle )
% Written by Mike Choi; April 2016
% This function intakes the unsolved Sudoku puzzle and checks whether or
% not each row, column, and 3x3 square has a repeating digit or not. 
% If false is returned, the function exits and the puzzle is not solved. 
% Otherwise if true is returned, then the puzzle is sent back to 
% the script and can now be solved.

% The 'any' function returns a boolean true/false output based on the input 
% to 'any'. For example, for any(puzzle(count,:)==value), the function will 
% return true if any of the values in the specified row are equal to value
% and false otherwise.

% The 'nnz' function returns the number of non-zero matrix elements in the
% input. So, for nnz(square(:)==value), the function will locate and store
% how many indices within the specifed 3x3 square is equal to "value".

noRep = true;                   % Initialize the value of noRep to be true
for count = 1:9                 % Iterates through the 9 rows of the puzzle
    for value = 1:9             % Used for checking if the cell value is equal to that of the candidate value
        if any(puzzle(count,:) == value)                    % Checks if any values in current row equal value
            counterR = nnz(puzzle(count,:) == value);       % If so, find how many indices in the row equal value
            if counterR > 1                 % Checks if more than one value in the row is equal to value
                noRep = false;              % If so, then the matrix is unsolvable
                return;                     % Exits the function
            end % counterR > 1
        end % repeated value check
        if noRep == true                                    % Checks to see if the puzzle is still solvable
            if any(puzzle(:,count) == value)                % Checks if any values in current column equal value
                counterC = nnz(puzzle(:,count) == value);   % If so, find how many indices in column equal value
                if counterC > 1             % Checks if more than one value in the column is equal to value
                    noRep = false;          % If so, then the matrix is unsolvable
                    return;                 % Exits the function
                end % counterC > 1
            end % repeated value check
        end % if solvable condition
    end % value loop
end % index loop

if noRep == true                % Checks if the previous loop returned a false or not; will not run if false
    for R = 1:3:9               % Iterates through each "row square" as there are three squares per row
        for C = 1:3:9           % Iterates through each "column square" as there are three squares per column
            [ROW,COL] = gridSq(R,C);        % Iterates through the 9 3x3 squares based on R and C
            square = puzzle(ROW,COL);       % Puts puzzle squares into a matrix called square after each new square
            for value = 1:9;                % This will be used to test each square for numbers from 1 through 9
                if any(square(:) == value)                  % Checks if any values in current square equals value
                    counterS = nnz(square(:) == value);     % If so, find how many indices in square equals value
                    if counterS > 1             % Checks is more than one value in the square is equal to value 
                        noRep = false;          % If so, then matrix is unsolvable
                        return;                 % Exits the function
                    end % counterS > 1
                end % repeated value check
            end % value loop
        end % square column loop
    end % square row loop
end % if solvable condition
end