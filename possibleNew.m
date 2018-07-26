function [ valGrid,lengths ] = possibleNew( puzzle )
% Written by Mike Choi; April 2016
% This function goes through the Sudoku puzzle and locates the possible
% values for each cell based on the original, unsolved puzzle. It iterates
% through each cell in the puzzle grid and puts the possible solution
% values into a new 9x9 matrix, which also puts a value of 0 for the puzzle
% cells which have a non-zero value. At the end, it locates the first cells
% which have an empty slot in the original puzzle + one possible value and
% an empty spot + no possible values respectively.

% Find function finds the non-zero elements according to the given input.
% For example, find(puzzle(row,:)) locates the indices of the non-zero
% elemnts of the given puzzle in the specified row.

% cellfun function applies the first input to the cell, the second input.
% For example, cellfun(@length,valGrid) makes a new double type matrix
% which is composed of the lengths of each cell element of valGrid. The
% important thing to note here is that valGrid is a cell type and the new
% matrix is double.

valGrid = cell(9,9);        % Pre-allocates 9x9 cell for possible values (use cell for more than one value per cell)
for row = 1:9               % Iterates for the 9 rows of the grid
    for col = 1:9           % Iterates for the 9 columns of the grid
        [R,C] = gridSq(row,col);        % Calculates the current square for the corresponding row and column values
        square = puzzle(R,C);           % Inputs the square given by R and C into a new 3x3 matrix "square"
        if puzzle(row,col) == 0         % If the current cell in the puzzle is empty
            possVal = 1:9;              % An array of the total possible cell values from 1 to 9
                if puzzle(row,col) == 0                     % Row: Checks to see if the current cell is non-zero
                    nzR = puzzle(row,find(puzzle(row,:)));  % Row: Puts the non-zero values into an array
                    possVal(nzR) = 0;                       % Row: Eliminates values equal to nzR in current row
                    nzC = puzzle(find(puzzle(:,col)),col);  % Column: Puts the non-zero values into an array
                    possVal(nzC) = 0;                       % Column: Eliminates values equal to nzC in current row
                end % row/column condition
                if any(square ~= 0)            % Square: Checks to see if current square has non-zero values
                    nzS = square(find(square>0));   % Square: Puts the non-zero values into an array
                    possVal(nzS) = 0;               % Square: Eliminates values equal to nzS in current square
                end % square condition
            nozero = possVal(possVal~=0);   % Makes an array of the non-zero values of the possible values array
            valGrid{row,col} = nozero;      % In current cell, declare possible values; move to next cell
        end % empty index condition
    end % column loop
end % row loop
lengths = cellfun(@length,valGrid);     % Allocates each cell length into corresponding index in 9x9 double matrix
end % function