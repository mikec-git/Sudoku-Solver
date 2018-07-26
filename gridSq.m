function [ Row,Col ] = gridSq( row,col )
% Written by Mike Choi; April 2016
% This function simply checks which square of the 9x9 sudoku puzzle the
% current cell is located in, and returns the row and column arrays
% corresponding to the said square.

switch (row || col)     % Look for cases with respect to "row" or "column"
    case (1<=row && row<=3) && (1<=col && col<=3)   % If in the (1:3)x(1:3) square (top left)
        Row = 1:3;      % Set row indices to 1:3
        Col = 1:3;      % Set row indices to 1:3
    case (1<=row && row<=3) && (4<=col && col<=6)   % If in the (1:3)x(4:6) square (top mid)
        Row = 1:3;      % Set row indices to 1:3
        Col = 4:6;      % Set row indices to 4:6
    case (1<=row && row<=3) && (7<=col && col<=9)   % If in the (1:3)x(7:9) square (top right)
        Row = 1:3;      % Set row indices to 1:3
        Col = 7:9;      % Set row indices to 7:9
    case (4<=row && row<=6) && (1<=col && col<=3)   % If in the (4:6)x(1:3) square (mid left)
        Row = 4:6;      % Set row indices to 4:6
        Col = 1:3;      % Set row indices to 1:3
    case (4<=row && row<=6) && (4<=col && col<=6)   % If in the (4:6)x(4:6) square (middle)
        Row = 4:6;      % Set row indices to 4:6
        Col = 4:6;      % Set row indices to 4:6
    case (4<=row && row<=6) && (7<=col && col<=9)   % If in the (4:6)x(7:9) square (mid right)
        Row = 4:6;      % Set row indices to 4:6
        Col = 7:9;      % Set row indices to 7:9
    case (7<=row && row<=9) && (1<=col && col<=3)   % If in the (7:9)x(1:3) square (bottom left)
        Row = 7:9;      % Set row indices to 7:9
        Col = 1:3;      % Set row indices to 1:3
    case (7<=row && row<=9) && (4<=col && col<=6)   % If in the (7:9)x(4:6) square (bottom mid)
        Row = 7:9;      % Set row indices to 7:9
        Col = 4:6;      % Set row indices to 4:6
    case (7<=row && row<=9) && (7<=col && col<=9)   % If in the (7:9)x(7:9) square (bottom right)
        Row = 7:9;      % Set row indices to 7:9
        Col = 7:9;      % Set row indices to 7:9
end