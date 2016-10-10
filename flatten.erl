-module(flatten).

-export([flatten/1, flatten_test/0]).

% Main entry point
flatten(List) ->
  flatten(List, []).


% To run tests: 
% $  erl
% >  c(flatten)
% >  eunit:test(flatten).
flatten_test() ->
  [1,2,3] = flatten:flatten([1,2,3]),
  [1,2,3] = flatten:flatten([1,2,[3]]),
  [1,2,3] = flatten:flatten([1,2,3,[]]),
  [1,2,3,4,5] = flatten:flatten([1,2,3,[4,5]]),
  [1,2,3,4,5,1,2,3,6] = flatten:flatten([1,2,3, [4, [5], [1, [2, [3]]]], 6]),
  ok.


% If the List is empty, just return the result (Acc)
flatten([], Acc) ->
  Acc;

% Use a guard to determine if the next element is itself a list
flatten([Hd|Tl], Acc) when is_list(Hd) ->
  NewAcc = Acc++flatten(Hd),
  flatten(Tl, NewAcc);

% Standard case, just append the element (Hd) to result (Acc)
% and recursively call flatten with the remaining list (Tl)
flatten([Hd|Tl], Acc) ->
  flatten(Tl, Acc++[Hd]).
