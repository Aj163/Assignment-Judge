-module(praveen).
-export([main/1]).

main(L) -> [ans(L, 5001)].

ans(L, 0) -> L;
ans(L, C) -> ans(lists:reverse(L), C-1).