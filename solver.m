function [ puzzle ] = solver( puzzle )
% Written by Mike Choi; April 2016
% This code uses the simple concept of backtracking.
% This techninque uses the iteration of every possible value in each cell
% to test out the possible solutions for the puzzle, so it will test out
% one term and check for repeating values in the corresponding row and
% column and square, and then if the solution works, it will test another
% value in the next cell adjacent to it, repeating the steps mentioned.

% The 'any' function returns a boolean true/false output based on the input
% to 'any'. For example, for any(lengths >= 0), the function returns true
% if any of the lengths are greater than or equal to 0 and false
% otherwise.

% Note that the {} brackets are used when applied to a cell. () will not
% work.

% 'Disp' simply displays the given input, so here, I used it to show each
% step as the solver goes through the recursion steps.

% 'Break' will exit out of the for/while loop the program is running.

% 'Return' will exit out of the current function it is running, so when
% return is used after a recursion, the program will return to the
% location where the recursion step occurred and proceed to the next step.

[vals,lengths] = possibleNew(puzzle);   % Initially calculates possible values per cell and length of each cell
if any(lengths >= 0)                    % Checks to see that lengths are not empty cells
    oneV = 0; noV = 0;                  % Sets value for [one solution/empty cell] and [no solution/empty cell]
    for cc = 1:9                        % oneV: Iterates through the 9 columns
        for rc = 1:9                    % Iterates through the 9 rows
            if lengths(rc,cc) == 1 && puzzle(rc,cc) == 0    % Checks if one sol'n and current cell is empty
                oneV = rc + 9*(cc-1);                       % Sets oneV value to index of current cell
                break;                                      % Only need first cell so breaks out of loop
            end % 1 sol'n check
        end % row loop
    end % column loop
    for cc = 1:9                        % noV: Iterates through the 9 columns
        for rc = 1:9                    % Iterates through the 9 rows
            if lengths(rc,cc) == 0 && puzzle(rc,cc) == 0    % Checks if no sol'n and current cell is empty
                noV = rc + 9*(cc-1);                        % Sets noV value to index of current cell
                break;                                      % Only need first cell so breaks out of loop
            end % 0 sol'n check
        end % row loop
    end % column loop
    while oneV > 0 && noV == 0          % Checks if [1 sol'n/empty cell] available and sol'n possible
        puzzle(oneV) = vals{oneV};      % Inputs solution into puzzle as current cell only has 1 possible solution
        disp(puzzle)                    % Displays updated solution 
        [vals,lengths] = possibleNew(puzzle);   % Re-calculates possible solutions and their lengths
        oneV = 0; noV = 0;                      % Resets oneV and noV to zero
        for cc = 1:9                            % oneV: Iterates through the 9 columns
            for rc = 1:9                        % Iterates through the 9 rows
                if lengths(rc,cc) == 1 && puzzle(rc,cc) == 0    % Checks if one sol'n and current cell is empty
                    oneV = rc + 9*(cc-1);                       % Sets oneV value to index of current cell
                    break;                                      % Only need first cell so breaks out of loop
                end % 1 sol'n check
            end % row loop
        end % column loop
        for cc = 1:9                            % noV: Iterates through the 9 columns
            for rc = 1:9                % Iterates through the 9 rows
                if lengths(rc,cc) == 0 && puzzle(rc,cc) == 0    % Checks if no sol'n and current cell is empty
                    noV = rc + 9*(cc-1);                        % Sets noV value to index of current cell
                    break;                                      % Only need first cell so breaks out of loop
                end % 0 sol'n check
            end % row loop
        end % column loop
    end % [1 sol'n/cell] check
    if noV > 0                      % Checks if there is empty cell with no sol'n (current solution set fails)
        return                      % If so, returns back to previous solution input (line 102)
    end % failed sol'n check
end % lengths loop

counter = 0;                        % Initialize counter
for place = 1:81                    % Iterates for each index of puzzle
    if puzzle(place) == 0           % Checks if current puzzle location value is zero
        counter = counter + 1;      % If so, increase counter by 1
        if counter > 0              % Checks if counter is greater than 1 (means puzzle not finished)
            break                   % Exits loop
        end % counter check
    end % zero check
end % index value loop
if counter > 0                      % Checks if there is an unfilled slot in the puzzle
    empty = 0;                      % Initialize empty variable
    for CC = 1:9                    % Iterates through the 9 columns
        for RR = 1:9                % iterates through the 9 rows
            if puzzle(RR,CC) == 0       % Checks if current puzzle location value is zero
                empty = RR+9*(CC-1);    % Record current index; value increases top left -> bottom right of puzzle
                break;                  % Only need first empty location, so break out of loop
            end % zero check
        end % row loop
        if empty > 0                % Checks if there is an empty location in the puzzle
            break;                  % If so, breaks out of loop and moves onto line 95
        end % empty check
    end % column check
    temp = puzzle;                  % Makes a placeholder for the current solution of the puzzle
    cellVal = vals{empty};          % For empty puzzle location, values of corresponding location in cell recorded
    cellLen = length(vals{empty});  % Length of current cell recorded
    for Cval = 1:cellLen            % Iterates through the number of possible values in current cell
        puzzle = temp;                  % Recalls placeholder matrix from previous solution
        puzzle(empty) = cellVal(Cval);  % Inputs first possible solution into corresponding empty slot in puzzle
        disp(puzzle)                    % Displays new solution table
        puzzle = solver(puzzle);        % Recursively goes through to recalculate new possible solutions + lengths        
        count = 0;                      % initialize counter to 0
        for iter = 1:81                 % Iterates through all 81 spots in the puzzle
            if puzzle(iter) > 0         % Checks if current location in puzzle is non-zero
                count = count + 1;      % If so, increase counter by 1
                if count == 81          % Checks to see if puzzle completely filled with possible solution values
                    return              % If so, then a solution has been found; returns to main script
                end % sol'n check 
            end % value > 0 check
        end % puzzle iteration
    end % cell length loop
end % unfilled cell check
end % function

% For the return statement in line 69, the reason why the function can
% revert back to its previous solution sets is because once the iterations
% of line 98 are complete and the proposed solution set of cellVal is not
% the right one, then the function will run to the end at line 114, then it
% will exit the function and continue back to its PREVIOUS function 
% iteration, which still has more possible choices from line 98. This is 
% why this function can work with any possible sudoku puzzle as it can
% iterate through ANY possible solution set, and this is also why it may
% take a while for more difficult puzzles, as there will be more possible
% solution values per cell.