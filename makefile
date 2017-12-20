.PHONY: build

install:
	@npm install

build: copy-assets
	@./node_modules/.bin/webpack  --progress --colors --devtool source-map -p

copy-assets:
	@cp login.html docs/
	@cp css/login.css .
	@cp images/user.png .

run:
	@echo "**************************************************"
	@echo "* open http://localhost:8080/webpack-dev-server/ *"
	@echo "**************************************************"
	@./node_modules/.bin/webpack-dev-server --host=0.0.0.0 --progress --colors --devtool cheap-module-inline-source-map --hot --inline

data:
	@node dataGenerator/generate.js
