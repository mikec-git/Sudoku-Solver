test = [0 0 2 0 6 0 0 0 0 ; % "Hard"
        0 0 6 9 0 0 7 0 0 ; 
        0 1 0 0 0 3 0 0 4 ;
        0 0 0 6 0 1 0 0 5 ; 
        0 9 0 0 0 5 0 0 0 ; 
        0 0 7 0 0 0 8 0 0 ; 
        0 5 0 0 7 0 4 0 0 ; 
        1 0 0 0 0 0 0 0 3 ;
        2 0 0 0 0 0 1 0 0];
    
% test = [0 1 0 6 0 0 0 9 0 ; % "Easy"
%         0 8 0 0 3 0 0 0 2 ; 
%         5 0 7 0 0 0 0 0 4 ; 
%         1 2 0 0 0 0 0 7 0 ; 
%         0 0 0 1 0 0 0 5 0 ; 
%         9 0 0 0 0 8 0 0 0 ; 
%         0 0 2 0 0 3 4 0 1 ; 
%         6 5 1 0 0 0 0 0 7 ; 
%         0 0 0 0 0 0 0 6 0 ];
tic
noRep = NewCheck(test);         % Checks to see if current puzzle is actually solvable
    
if noRep == true                    % Checks to see if current puzzle is solvable
    solution = solver(test);        % Provides a solution for the current puzzle
    fprintf('The solution is: \n'); % Prints "The solution is: " and goes to next line
    disp(solution);                 % Displays final solution
else
    fprintf('The current puzzle is not a solvable puzzle!\n');
end
t = toc;
disp(t);    % Displays time to run in seconds