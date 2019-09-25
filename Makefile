name=untitled

.PHONY: all
all: help

.PHONY: help
help:
	# ---------------------------------------------------------------------------
	#  EnviroSoftwareSolutions.com website Makefile
	#
	#  Targets:
	#
	#  	help 			:	show this message
	#  	pub 			:	publish envirosoftwaresolutions.com website 
	#  						(requires ssh key)
	#  	serve 			:	serve website locally (port 1313)
	#  	browse			:	launch browser locally (port 1313)
	#  	test			:	test links using linkchecker
	#  	post name=untitled	:	create and edit a new post
	# ---------------------------------------------------------------------------

.PHONY: pub
pub:
	rm -rf ./public
	hugo && rsync -avz -og --chown=toddg:www-data public/ root@zwrob:/var/www/envirosoftwaresolutions.com --delete 

.PHONY: server
server: serve

.PHONY: serve
serve:
	hugo server -D

.PHONY: browse
browse:
	sensible-browser http://localhost:1313

.PHONY: test
test:
	linkchecker http://localhost:1313

.PHONY: post
post:
	hugo new posts/${name}.md
	vim content/posts/${name}.md
