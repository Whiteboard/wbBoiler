# USAGE:
# USE `make watch` to watch js and less files
# USE `make` to build

DATE=$(shell date +%I:%M%p)
CHECK=\033[32m✔\033[39m
HR=\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#

build:
	# `make build` and `make` do nothing; run:
	# 		make production
	# to do a one-off build, or:
	# 		make watch
	# to watch less and js files.
	# Other options:
	# 		make clean
	#			# clears out generated files (if there were errors)
	#		make install
	#			# installs dependencies via npm
	# if make install fails, you probably don't have npm installed.

production:
	@echo "\n${HR}"
	@echo "Building wbBoiler"
	@echo "\n${HR}"
	@echo "Cat'ing JS"
	@echo "/* do not modify this directly!" > js/main.js
	@echo "Modify plugins.js and script.js, then use the Makefile, please. */" >> js/main.js
	@cat js/plugins.js js/script.js >> js/main.js
	@echo "Hinting JS"
	@jshint js/main.js
	@echo "Min'ing JS"
	@uglifyjs -nc js/main.js > js/main.min.js
	@jshint js/main.min.js
	@echo "Compiling Less"
	@mkdir -p css
	@recess --compile ./less/style.less > css/style.css
	@echo "Prefixing and minifying style.css > style.min.css"
	@prefixr -i css/style.css -c > css/style.min.css
	@echo "${CHECK} Donezo at ${DATE}"
clean:
	@echo "Deleting generated files: js/main.js main.min.js css/style.css css/style.min.css"
	@rm js/main.js js/main.min.js css/style.css css/style.min.css
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