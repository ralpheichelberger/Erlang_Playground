-module(messagereader). %% Name of module (must match file name)

-export([start/0]). %% Public interface of module

start() ->
	spawn(fun() -> loop() end). %% Spawn a new fun which returns process Id to caller. Now we have somewhere to send messages


loop() ->
	receive    %% Scan the mailbox - match a pattern
	
		{happy, Message} ->  %% Tuple, first item is an atom (lowercase, name == value), second item is a variable
			io:format("You received a happy message: ~p~n", [Message]),
			loop();		%% Recursion


		{sad, Message} ->
			io:format("You received a sad message: ~p~n", [Message]),
			loop();


		AnythingElse ->
			io:format("You received junk mail: ~p~n", [AnythingElse]),
			loop()

	end.
		
		
