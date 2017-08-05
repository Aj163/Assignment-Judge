-module(ashwin).
-export([main/1]).

main(L) -> [ret(L, 5000)].

ret(L, 0) -> L;
ret(L, C) -> ret(lists:reverse(L), C-1).