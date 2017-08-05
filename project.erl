% ###########################################    PROJECT    ###########################################
% ########################################### Ashwin Joisa  ###########################################
% ########################################### Praveen Gupta ###########################################

% ASSIGNMENT JUDGE

-module(project).
-export([main/1]).

% ############################################################################################################### main

main(Input_List) -> 
	
	cover:compile("solution.erl"),

	{ok, Lof} = file:list_dir("./"),
	List_of_files = qsort(Lof),

	io:fwrite("~n####################################################################################################################~n"),

	{_, Output} = timer:tc(solution, main, [Input_List]),

	io:fwrite("~n____________________________________________________________________________________________________________________~n"),
	io:fwrite("~n~s ~-20s~-20s~s ~-20s~s~n", ['FILE', 'NAME', 'STATUS', 'EXECUTION', 'TIME(ms)', 'OUTPUT']),
	io:fwrite("~n--------------------------------------------------------------------------------------------------------------------~n"),
	run(List_of_files, Input_List, Output),
	io:fwrite("____________________________________________________________________________________________________________________~n"),

	{Tim, Out} = timer:tc(solution, main, [Input_List]),
	io:fwrite("~nCorrect Output : ~p", Out),
	io:fwrite("~nExecution Time : ~p ms~n", [Tim/1000]),

	io:fwrite("~n####################################################################################################################~n").

% ############################################################################################################### run

run([], _, _) -> io:fwrite("~n");
run([H|T], Input_List, Correct_output) ->

	case (string:right(H, 4) =:= ".erl" andalso (H =/= "solution.erl" andalso H =/= "project.erl")) of

		true -> File_atom = list_to_atom(string:left(H, string:len(H) - 4)),
				cover:compile(H),
				%spawn(project, check, [Input_List, File_atom, Correct_output]),
				check(Input_List, File_atom, Correct_output),
				run(T, Input_List, Correct_output);

		false-> run(T, Input_List, Correct_output)
	end.

% ############################################################################################################### check

check(Input_List, File_name, Correct_output) ->
	
	{Time, Output} = timer:tc(File_name, main, [Input_List]),

	case Correct_output =:= Output of

		true -> io:fwrite("~-25s~-20s~-30.3f", 
				[atom_to_list(File_name), "Correct Answer", Time/1000]),
				io:fwrite("~p ~n", Output);

		false-> io:fwrite("~-25s~-20s~-30.3f", 
				[atom_to_list(File_name), "Wrong Answer", Time/1000]),
				io:fwrite("~p ~n", Output)
	end.

% ############################################################################################################### Quick Sort

qsort([]) -> [];
qsort([Pivot|T]) -> qsort([X || X <- T, X < Pivot]) ++ [Pivot] ++ qsort([X || X <- T, X >= Pivot]).