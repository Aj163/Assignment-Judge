%###########################################    PROJECT    ###########################################
%########################################### Ashwin Joisa  ###########################################
%########################################### Praveen Gupta ###########################################
-module(project).
-export([main/0]).

main() -> 
	
	{ok, List_of_files} = file:list_dir("./"),
	%io:fwrite("~p~n", [List_of_files]),

	run(List_of_files).


run([]) -> ok;
run([H|T]) ->
	case string:right(H, 4) =:= ".erl" of
		true -> io:format("~s, ", [string:left(H, string:len(H) - 4)]), run(T);
		false-> run(T)
	end.

check(Input_List, File_name, Correct_output) ->

	Output = File_name:main(Input_List),
	io:format("~nExpected : ~p~nReturned ~p : ~p~n", [Correct_output, File_name, Output]),

	case Correct_output =:= Output of
		true -> congrats;
		false-> dumbass
	end.