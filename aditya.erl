-module(aditya).
-export([main/1]).

main(L) -> [ssort(L)].

ssort([]) -> [];
ssort(List) -> selection_sort(List, []).

selection_sort([], SortedList) -> SortedList;
selection_sort([H|T], SortedList)->	
	{Max, Remaining} = max_elem(T, H, []),
    selection_sort(Remaining, [Max|SortedList]).

max_elem([], Max, Remaining) -> {Max, Remaining};
max_elem([H|T], Max, Remaining) when H < Max -> max_elem(T, Max, [H|Remaining]);
max_elem([H|T], Max, Remaining) -> max_elem(T, H, [Max|Remaining]).