-module(vilas).
-export([main/1]).

main(L) -> [bsort(L)].

bsort(L) when length(L) =< 1 -> L;
bsort(L) -> 
	List = biggestToRightEnd(L),
    bsort(lists:sublist(List, 1, length(List)-1)) ++ [lists:last(List)].


biggestToRightEnd([]) -> [];
biggestToRightEnd([A]) -> [A];
biggestToRightEnd([A, H|T]) when A > H ->[H|biggestToRightEnd([A|T])];
biggestToRightEnd([A, H|T]) -> [A|biggestToRightEnd([H|T])].