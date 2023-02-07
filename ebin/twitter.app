{application, 'twitter', [
	{description, "New project"},
	{vsn, "0.1.0"},
	{modules, ['follow_handler','hello_handler','login_handler','logout_handler','mention_handler','register_handler','retweet_handler','search_handler','test','tweet_handler','twitter','twitter_app','twitter_sup']},
	{registered, [twitter_sup]},
	{applications, [kernel,stdlib,cowboy]},
	{mod, {twitter_app, []}},
	{env, []}
]}.