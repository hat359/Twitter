-module(logout_handler).
-behavior(cowboy_handler).
-import(twitter,[start_master/0,master/1,datafetcher/0,master_node/0]).
-export([init/2]).
-compile(export_all).

init(Req0, State) ->




        

        Output=twitter:logoff(),
        io:fwrite("~p",[Output]),
       

        

	Req = cowboy_req:reply(200,
        #{<<"content-type">> => <<"text/plain">>},
        <<"Logout User API called">>,
        Req0),
	{ok, Req, State}.
