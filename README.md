# wbBoiler - a boilerplate to get going fast

=========

wbBoiler uses a bunch of proven practices to get up and running. We're borrowing some concepts used by Bootstrap, h5bp, and others. To get going quickly, clone the repo and run
```bash
make install # run this the first time you use wbBoiler only
make watch
```
from the project directory. Changes to *.less and script.js/plugin.js will trigger a build.

Note: the makefile depends on Node.js and the Node executables UglifyJS, Prefixr, JSHint, and Recess, all of which are available through npm install -g. We've included a `make install` action that will run the install on the latest versions of these requirements, assuming you have npm installed.

## Meta tags

=========

We've included meta tags by default in the header for Facebook's Open Graph integration and Twitter Cards. (Note: Twitter Cards is not currently available to the public except by opt-in application.)

## Outside tools

=========

External tools we are using or borrowing from include:

- [Skeleton](http://www.getskeleton.com/) (css grid system and simple ui elements)
- [Normalize.css](http://necolas.github.com/normalize.css/)
- [CSS-Tricks' Chris Coyier's Less Mixins Snippets](http://css-tricks.com/snippets/css/useful-css3-less-mixins/)
- [Less CSS](http://lesscss.org/)
- [jQuery](http://jquery.com/)
- [Modernizr](http://modernizr.com/)
- Parts and pieces of [H5bp](https://github.com/h5bp/html5-boilerplate)
- [Observr](https://github.com/kevinburke/observr)

## Kitchensink.html

=========

An html "Kitchen sink" has been included to ensure that you have made sensible defaults for base HTML elements.

## BEFORE GOING LIVE:

=========

1. Fill in Title attribute
2. Fill in all meta attributes, or remove them
3. Replace all Apple icons/favicons
4. Fill in humans.txt (http://humanstxt.org/)
5. Fill in robots.txt based on (https://developers.google.com/webmasters/control-crawl-index/)
6. Fill in crossdomain.xml
7. Remove or obscure kitchensink.html
8. Customize .htaccess as necessary
9. Switch to production/minified code (js and css)