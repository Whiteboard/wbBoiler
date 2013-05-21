# USAGE:
# USE `make watch` to watch js and less files
# USE `make` to build

DATE=$(shell date +%I:%M%p)
CHECK=\033[32m✔\033[39m
HR=\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#

build:
	@echo ============================================================================================
	@echo ============ wbBoiler is awesome. ==========================================================
	@echo ============================================================================================
	@echo "  \"make build\" and \"make\" do nothing; run:"
	@echo "  	make production"
	@echo "  to do a one-off build, or:"
	@echo "  	make watch"
	@echo "  to watch less and js files."
	@echo "  Other options:"
	@echo "    make clean"
	@echo "    # clears out generated files (if there were errors)"
	@echo "    make install"
	@echo "    # installs dependencies via npm"
	@echo "  if make install fails, you probably don't have npm/node installed. Check out:"
	@echo "    - https://npmjs.org/"
	@echo "    - and"
	@echo "    - http://nodejs.org/"
	@echo ============================================================================================
	@echo ============================================================================================

help:
	@make build

production:
	@echo "\n${HR}"
	@echo "Building wbBoiler"
	@echo "\n${HR}"
	@echo "Cat'ing JS"
	@echo "/* do not modify this directly!" > js/main.js
	@echo "Modify plugins.js and script.js, then use the Makefile, please. */" >> js/main.js
	@cat js/vendor/jquery-2.0.0.min.js js/vendor/jquery-migrate-1.2.1.min.js js/plugins.js js/script.js >> js/main.js
	@echo "Hinting JS"
	@jshint js/main.js
	@echo "Min'ing JS"
	@uglifyjs -nc js/main.js > js/main.min.js
	@echo "Compiling Less"
	@mkdir -p css
	@recess --compile ./less/style.less > css/style.css
	@echo "Prefixing and minifying style.css > style.min.css"
	@prefixr -i css/style.css -c > css/style.min.css
	@echo "${CHECK} Donezo at ${DATE}"

clean:
	@echo "Deleting generated files: js/main.js main.min.js css/style.css css/style.min.css"
	@rm -f js/main.js js/main.min.js css/style.css css/style.min.css
	@echo "${CHECK} Donezo at ${DATE}"

watch:
	@echo "Watching less and js files..."; \
	watchr -e "watch('less/.*\.less|js/script.js|js/plugins.js') { system 'make production' }"

install:
	@echo "Installing components... this may take a while..."
	@npm install -g jshint
	@npm install -g uglify-js
	@npm install -g recess
	@npm install -g prefixr
	@echo "${CHECK} Donezo at ${DATE}"