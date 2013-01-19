# USAGE:
# USE `make watch` to watch js and less files
# USE `make` to build

DATE=$(shell date +%I:%M%p)
CHECK=\033[32m✔\033[39m
HR=\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#

build:
	@echo "\n${HR}"
	@echo "Building MLK"
	@echo "\n${HR}"
	@echo "Cat'ing JS"
	@echo "/* do not modify this directly!" > js/main.js
	@echo "Modify plugins.js and script.js, then use the Makefile, please. */" >> js/main.js
	@cat js/plugins.js js/script.js >> js/main.js
	@echo "Hinting JS"
	@jshint js/main.js
	@echo "Min'ing JS"
	@uglifyjs -nc js/main.js > js/main.min.js
	@echo "Hinting min'd js"
	@jshint js/main.min.js
	@echo "Compiling Less"
	@recess --compile ./less/style.less > css/style.css
	@echo "Prefixing and minifying style.css > style.min.css"
	@prefixr -i css/style.css -c > css/style.min.css
	@echo "${CHECK} Donezo at ${DATE}"
watch:
	@echo "Watching less and js files..."; \
	watchr -e "watch('less/.*\.less|js/script.js|js/plugins.js') { system 'make' }"
install:
	@echo "Installing components... this may take a while..."
	@npm install -g jshint
	@npm install -g uglifyjs
	@npm install -g recess
	@npm install -g prefixr
	@echo "${CHECK} Donezo at ${DATE}"