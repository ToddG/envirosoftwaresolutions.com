.PHONY: all
all: deploy

.PHONY: deploy
deploy:
	rm -rf ./public
	hugo && rsync -avz -og --chown=toddg:www-data public/ root@zwrob:/var/www/envirosoftwaresolutions.com --delete 

