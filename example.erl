-module(example).
-export([main/1]).

main([A, B]) -> [A-B]
