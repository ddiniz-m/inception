#!/bin/bash

#Greps every line that does NOT(-v) have an '#' at the start(^), AKA comments
#xargs set grep output in a single line
for secrets in $(grep -v '^#' ./srcs/.env)
do
	#Removes '_' from .env variables
	secrets=${secrets//_}
	
	#${secrets%=*} trims .env variable until '='
	#${secrets#*=} trims .env variable after '='
	docker secret create ${secrets%=*} <(echo -n ${secrets#*=})

done