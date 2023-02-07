-module(twitter_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
  
	Dispatch = cowboy_router:compile([  % this compiles the files required when the routes are called. 
        {'_', [{"/",hello_handler,[]},
        
        {"/register",register_handler,[]},
        
        {"/login",login_handler,[]},
        {"/follow",follow_handler,[]},
        {"/tweet",tweet_handler,[]},
         {"/search",search_handler,[]},
          {"/mention",mention_handler,[]},
          {"/logoff",logout_handler,[]},
          {"/retweet",retweet_handler,[]}]}
    ]),

    	Dispatch2 = cowboy_router:compile([ % This compiles the frontend files 
        {'_', [{"/",cowboy_static,{priv_file,twitter,"twitter.html"}},
            {"/m",cowboy_static,{priv_file,twitter,"main.html"}}]}
    ]),

    % 	Dispatch3 = cowboy_router:compile([
    %     {'_', [{"/",hello_handler,[]},
        
    %     {"/register",register_handler,[]},
    %     {"/login",login_handler,[]},
    %     {"/follow",follow_handler,[]},
    %     {"/tweet",tweet_handler,[]},
    %      {"/search",search_handler,[]},
    %       {"/mention",mention_handler,[]},
    %       {"/logoff",logout_handler,[]}]}
    % ]),
    	

    	
    	

   

    {ok, _} = cowboy:start_clear(http1, % this starts the backend
        [{port, 8000}],
        #{env => #{dispatch => Dispatch}}
    ),

     {ok, _} = cowboy:start_clear(http2, % this starts the frontend 
        [{port, 8080}],
        #{env => #{dispatch => Dispatch2}}
    ),


  
	twitter_sup:start_link().

stop(_State) ->
	ok.
