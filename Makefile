# USAGE:
# USE `make watch` to watch js and less files
# USE `make` to build

DATE=$(shell date +%I:%M%p)
CHECK=\033[32m✔ Done\033[39m
HR=\033[37m--------------------------------------------------\033[39m

build:
	@echo ============================================================================================
	@echo ============ WBBoiler is awesome. ==========================================================
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
	@echo "${HR}"

	@echo "Cat'ing JS..."
	@echo "/* do not modify this directly!" > js/maintmp.js
	@echo "Modify plugins.js and script.js, then use the Makefile, please. */" >> js/maintmp.js
	@cat js/plugins.js js/script.js >> js/main.js
	@echo " ${CHECK}"
	@echo "Hinting JS..."
	@jshint js/maintmp.js
	@cat js/vendor/jquery-2.0.0.min.js js/vendor/jquery-migrate-1.2.1.min.js js/maintmp.js > js/main.js
	@rm js/maintmp.js
	@echo " ${CHECK}"
	@echo "Min'ing JS..."
	@uglifyjs js/main.js -c > js/main.min.js
	@echo "             ${CHECK}"
	@echo "Compiling Less..."
	@mkdir -p css
	@recess --compile ./less/style.less > css/style.css
	@echo "Prefixing and minifying style.css > style.min.css"
	@prefixr -i css/style.css -c > css/style.min.css
	@echo "             ${CHECK}"
	@osascript -e 'tell application "Google Chrome" to tell the active tab of its first window to reload'
	@echo "${HR}"
	@echo "${HR}"
	@echo "${CHECK} -- ${DATE}"

clean:
	@echo "Deleting generated files: js/main.js main.min.js css/style.css css/style.min.css"
	@rm -f js/main.js js/main.min.js css/style.css css/style.min.css
	@echo "${CHECK} BUILD COMPLETE at ${DATE}"

watch:
	@echo "Watching less and js files..."; \
	observr -e "watch('less/.*\.less|js/script.js|js/plugins.js') { system 'make production' }"

install:
	@echo "Installing components... this may take a while..."
	@npm install -g jshint
	@npm install -g uglify-js
	@npm install -g recess
	@npm install -g prefixr
	@gem install observr
	@echo "${HR}"
	@echo "${HR}"
	@echo "${CHECK} -- ${DATE}"