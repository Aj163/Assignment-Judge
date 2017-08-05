

## <center> IEEE PROJECT :  Ashwin Joisa  &  Praveen Gupta </center>

 ## <center>Functional Programming with Erlang</center>
## <center>PROJECT NAME : Assignment Judge </center>


### ABOUT THE PROJECT : Assignment Judge 

><li> Assignment Judge is used to run the assignments submitted by students against the solution program, for a given input.
><li>It tells whether the ouput produced by an assignment file is correct/wrong, and also compares the execution time.
><li>The results are formatted into a table in alphabetical order of assignment file name. 
><li>We therefore recommend that the assignments submitted are named as per the first name of the student in lower case.


### HOW TO USE Assignment Judge

> <li>Write a "solution.erl" which gives the correct answer.
> <li>Move all the assignment files and solution.erl (including project.erl) into a common folder.
> <li>Compile project.erl in erlang
> <li>Command : 
```c(project).```
<br>
> Call project:main(Input).
> And your results are ready.


### FORMAT OF THE ERLANG PROGRAMS

> <li>Every assignment submission and the solution must have a main/1 function.
> <li>This function takes a list as parameter, which has the required input.
> <li>The main/1 function may call other functions but finally has to return 1 list, containing the Output.


### EXAMPLE USAGE

Assignment : Sort a list of integers.

Solution.erl:
```erlang
-module(solution).
-export([main/1]).

main(List) -> [qsort(List)].

qsort([]) -> [];
qsort([Pivot|T]) -> qsort([X || X <- T, X < Pivot]) ++ [Pivot] ++ qsort([X || X <- T, X >= Pivot]).
```
On the Erlang Shell:
<br>

<img src="/Output.png">


SCOPE FOR IMPROVEMENT

> This program assumes that all assignments and solution.erl and error free, and either give correct answer or wrong answer!<br>
> The next update will take care of this and compilation errors will be shown.<br>
> Results will be sorted as per execution time.<br>