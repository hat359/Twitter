-module(hello_handler).
-behavior(cowboy_handler).
-import(twitter,[start_master/0,master/1,datafetcher/0]).
-export([init/2]).

init(Req0, State) ->

%This is the fisrt entry point of the program. 
% This starts the server in the twitter code. 

        Output=twitter:start_master(),
        io:fwrite("~p",[Output]),
      
	Req = cowboy_req:reply(200,
        #{<<"content-type">> => <<"text/plain">>},
        <<"Twitter Part 2 ">>,
        Req0),
	{ok, Req, State}.
