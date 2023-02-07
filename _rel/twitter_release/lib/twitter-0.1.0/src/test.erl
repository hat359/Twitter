-module(test).
-compile(export_all).

-compile(nowarn_export_all).



init(Req0, _State) ->
    
    _Req = cowboy_req:reply(200,
        #{
    <<"content-type">> => <<"text/plain">>
}, "Hello world!"
       ,Req0).

main()->
    io:fwrite("Hello").