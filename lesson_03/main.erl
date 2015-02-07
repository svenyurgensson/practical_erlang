-module(main).

-export([get_users/0, get_females/1, split_by_age/1, get_id_name/1,
         get_females_id_name/1, get_females_id_name2/1]).

get_users() ->
    [{user, 1, "Bob", male, 22},
     {user, 2, "Helen", female, 14},
     {user, 3, "Bill", male, 11},
     {user, 4, "Kate", female, 18}].


get_females(Users) ->
    F = fun({user, _, _, male, _}) -> false;
           ({user, _, _, female, _}) -> true
        end,
    lists:filter(F, Users).


split_by_age(Users) ->
    F = fun({user, _, _, _, Age}) -> Age < 18 end,
    lists:partition(F, Users).


get_id_name(Users) ->
    F = fun({user, Id, Name, _, _}) -> {Id, Name} end,
    lists:map(F, Users).


get_females_id_name(Users) ->
    Users2 = lists:filter(fun({user, _, _, Gender, _}) -> Gender =:= female end, Users),
    lists:map(fun({user, Id, Name, _, _}) -> {Id, Name} end, Users2).


get_females_id_name2(Users) ->
    lists:filtermap(fun({user, _, _, male, _}) -> false;
                       ({user, Id, Name, female, _}) -> {true, {Id, Name}}
                    end, Users).