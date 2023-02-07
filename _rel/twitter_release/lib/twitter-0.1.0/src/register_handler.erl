-module(register_handler).
-behavior(cowboy_handler).
-import(twitter,[start_master/0,master/1,datafetcher/0,master_node/0]).
-export([init/2]).
-compile(export_all).

init(Req0, State) ->


% This is called when the user needs to register 

        Qstring = cowboy_req:parse_qs(Req0), % This reads the query from the query string 
        {_,Q} = lists:keyfind(<<"query">>,1,Qstring),
        NewString = binary_to_list(Q),% This converts binary to string 
        Nstr = list_to_atom(NewString),% this converts string to atom. 
        Output=twitter:reg(Nstr,123), % the  register function is called here
        io:fwrite("~p",[Output]), 

       

	Req = cowboy_req:reply(200, % the reply is sent from here
        #{<<"content-type">> => <<"text/plain">>},
        <<"User Registration API called">>,
        Req0),
	{ok, Req, State}.
