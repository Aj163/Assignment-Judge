% ###########################################    PROJECT    ###########################################
% ########################################### Ashwin Joisa  ###########################################
% ########################################### Praveen Gupta ###########################################

-module(project).
-export([main/0, check/3]).

% ############################################################################################################### main

main() -> 
	
	{ok, List_of_files} = file:list_dir("./"),

	{ok, Binary_List} = file:read_file("input.txt"),
	IL = binary_to_list(Binary_List),
	Input_List = string:left(IL, string:len(IL) - 1),

	{Time, Output} = timer:tc(solution, main, [Input_List]),
	io:fwrite("~nCorrect Output : ~p~nExecution Time : ~p ms~n", [Output, Time/1000]),

	io:fwrite("~n~s ~-20s~-20s~s ~-20s~s~n", ['FILE', 'NAME', 'STATUS', 'EXECUTION', 'TIME(ms)', 'OUTPUT']),
	run(List_of_files, Input_List, Output).

% ############################################################################################################### run

run([], _, _) -> ok;
run([H|T], Input_List, Correct_output) ->
	case (string:right(H, 4) =:= ".erl" andalso (H =/= "solution.erl" andalso H =/= "project.erl")) of

		true -> File_atom = list_to_atom(string:left(H, string:len(H) - 4)),
				%spawn(project, check, [Input_List, File_atom, Correct_output]),
				check(Input_List, File_atom, Correct_output),
				run(T, Input_List, Correct_output);

		false-> run(T, Input_List, Correct_output)
	end.

% ############################################################################################################### check

check(Input_List, File_name, Correct_output) ->

	{Time, Output} = timer:tc(File_name, main, [Input_List]),

	case Correct_output =:= Output of
		true -> io:fwrite("~-25s~-20s~-30.3f~p ~n", 
				[atom_to_list(File_name), "Correct Answer", Time/1000, Output]);
		false-> io:fwrite("~-25s~-20s~-30.3f~p ~n", 
				[atom_to_list(File_name), "Wrong Answer", Time/1000, Output])
	end.