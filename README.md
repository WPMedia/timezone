# Timezone

Format time in JavaScript using the IANA time zone database.

```javascript
var tz = require('@wpmedia/timezone/loaded'),
    equal = require('assert').equal,
    utc;

// Get POSIX time in UTC.
utc = tz('2012-01-01');

// Convert UTC time to local time in a localize language.
equal(tz(utc, '%c', 'fr_FR', 'America/Montreal'),
      'sam. 31 déc. 2011 19:00:00 EST');
```

A full-featured time zone aware date formatter for JavaScript.

 * **Timezone** is a MicroJS library in pure JavaScript with no dependencies
   that provides timezone aware date math and date formatting.
 * **Timezone** uses the IANA Database to determine the correct wall clock time
   anywhere in the world for any time since the dawn of standardized time.
 * **Timezone** formats dates with a full implementation of `strftime` formats,
   including the GNU `date` extensions.
 * **Timezone** represents time in POSIX time and local time using RFC 3999 date
   strings.
 * **Timezone** is a full featured standards based time library in pure
   JavaScript for under 3K minified and gzipped.

## Setup

Note the `git submodule update --init --recursive` command to initialize the submodules that sources some of the information. For more about submodules, see [Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules).

```console
$ git clone --quiet https://github.com/WPMedia/timezone
$ cd timezone
$ git submodule update --init --recursive
$ make && npm i && npm t
```

## Testing 

First, need to update the output in build folder via `make` and the `Makefile`. Then the test will be ran based on that update.

```console
$ make 
$ npm t
```

## Publishing 

Make sure you have an `.npmrc` that is sso-enabled and allows for updating github packages.

```.npmrc
@wpmedia:registry=https://npm.pkg.github.com/
registry=https://registry.npmjs.org

//npm.pkg.github.com/:_authToken={token generated from github}
```

We want to publish the package with a flattened folder structure. So it's needed to run `npm publish build/timezone`. After any change is made to the package.json, the `make` command needs to run to update the build folder's `package.json` within `build/timezone/package.json`.

To test what will be included in the npm publish, it's helpful to run `npm publish build/timezone --dry-run` to see what will be published.

```console
$ make
$ npm publish build/timezone
```

## License

The [MIT License](https://raw.github.com/bigeasy/timezone/master/LICENSE).
