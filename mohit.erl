-module(mohit).
-export([main/1]).

main(L) -> [msort(L)].

msort([]) -> [];
msort([A]) -> [A];
msort(L) -> 
	{A, B} = lists:split(length(L) div 2, L),
	merge(msort(A), msort(B)).

merge(A, []) -> A;
merge([], B) -> B;
merge([H1|T1], [H2|T2]) -> 	
	if H1 < H2 -> [H1] ++ merge(T1, [H2|T2]);
		true -> [H2] ++ merge([H1|T1], T2)
	end.