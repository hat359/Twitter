-module(tweet_handler).
-behavior(cowboy_handler).
-import(twitter,[start_master/0,master/1,datafetcher/0,master_node/0]).
-export([init/2]).
-compile(export_all).

init(Req0, State) ->




        Qstring = cowboy_req:parse_qs(Req0),
        {_,Q} = lists:keyfind(<<"query">>,1,Qstring),
        NewString = binary_to_list(Q),
       
        Output=twitter:tweet(NewString),
        io:fwrite("~p",[Output]),
       
        Req = cowboy_req:reply(200,
        #{<<"content-type">> => <<"text/plain">>},
        <<"Tweet API called">>,
        Req0),
	{ok, Req, State}.

        