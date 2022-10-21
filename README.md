# Timezone

> ℹ️ **_NOTE:_** This is a published fork of the [Timezone](https://github.com/bigeasy/timezone). The base library is no longer actively maintained. We noticed that the AM/PM meridians were not working for some locales and a [fix wasn't accepted in time on the base repo](https://github.com/bigeasy/timezone/issues/331). The fork is published to `@wpmedia/timezone` to [GitHub Packages](https://github.com/WPMedia/timezone/pkgs/npm/timezone). The library was initially picked by a previous employee. Please see Setup below for more information around using GitHub Packages.

Format time in JavaScript using the IANA time zone database.

```javascript
var tz = require("@wpmedia/timezone/loaded"),
  equal = require("assert").equal,
  utc;

// Get POSIX time in UTC.
utc = tz("2012-01-01");

// Convert UTC time to local time in a localize language.
equal(
  tz(utc, "%c", "fr_FR", "America/Montreal"),
  "sam. 31 déc. 2011 19:00:00 EST"
);
```

A full-featured time zone aware date formatter for JavaScript.

- **Timezone** is a MicroJS library in pure JavaScript with no dependencies
  that provides timezone aware date math and date formatting.
- **Timezone** uses the IANA Database to determine the correct wall clock time
  anywhere in the world for any time since the dawn of standardized time.
- **Timezone** formats dates with a full implementation of `strftime` formats,
  including the GNU `date` extensions.
- **Timezone** represents time in POSIX time and local time using RFC 3999 date
  strings.
- **Timezone** is a full featured standards based time library in pure
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

Make sure you have an `.npmrc` that is sso-enabled and allows for updating GitHub Packages.

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

## Available imports

### `@wpmedia/timezone/loaded`

Includes `@wpmedia/timezone/locales` and `@wpmedia/zones`. Also includes the default library of utils for `@wpmedia/timezone`. This is a large import and should be used with caution.

### `@wpmedia/timezone`

The default import at the [index](./build/timezone/index.js). This includes date utils for converting to and from POSIX time and RFC 3999 date strings.

This can not be cleaned on post-install or else core functionality will be affected.

### `@wpmedia/timezone/zones`

The default import at the [zones](./build/timezone/zones.js). This has location-specific information around regions and countries, such as [US](./build/timezone/US/index.js). Locales is also included in this import.

### `@wpmedia/timezone/locales`

Includes all potential locales, such as [`af_ZA.js`](./build/timezone/af_ZA.js). This is a large import and should be used with caution. These locales include month names and default formatting.

This can be cleaned on post-install to only include the required locales.

## Debugging

If all of the tests do not pass, please make sure you have the latest version of the submodules. See Setup above for more information `git submodule update --init --recursive`.

## License

The [MIT License](https://raw.github.com/bigeasy/timezone/master/LICENSE).
