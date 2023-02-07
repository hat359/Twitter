-module(mention_handler).
-behavior(cowboy_handler).
-import(twitter,[start_master/0,master/1,datafetcher/0,master_node/0]).
-export([init/2]).
-compile(export_all).

init(Req0, State) ->


% This is called when the user needs to check mentions 

        

        Output=twitter:mention(), % the mention function is run here
        io:fwrite("~p",[Output]),
       
	Req = cowboy_req:reply(200,
        #{<<"content-type">> => <<"text/plain">>},
        <<"Mention Querying API called">>,
        Req0),
	{ok, Req, State}.
