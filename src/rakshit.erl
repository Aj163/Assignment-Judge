-module(rakshit).
-export([main/1]).

main(L) -> [isort(L)].

isort(List) -> insertion_sort(List, []).

insertion_sort([], List) -> List;
insertion_sort([H|T], List) -> insertion_sort(T, insert(H, List)).	

insert(X, []) -> [X];
insert(X, [H|T]) when X =< H -> [X | [H|T]];
insert(X, [H|T]) -> [H | insert(X, T)].