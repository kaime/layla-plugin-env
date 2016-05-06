# Layla Env plugin

Read and write environment variables from [Layla](//github.com/krokis/layla) code.

## Installation

Install as a dependency of your project with NPM:

~~~ sh
npm install layla-plugin-env --save # or --save-dev
~~~

## Usage

Require the plugin in your stylesheet. An `Env` object will be injected wherever you `use` the plugin. Use the `::` operator on it to read and write environment variables:

~~~ lay
// Use the plugin
use 'env'

// Read the `DEBUG` environment variable
$debug = Env::DEBUG

// Write (export) the `DEBUG` environment variable
Env::DEBUG = 0
~~~

All values are returned as strings and implicitly converted to strings when they're set. If you try to read an undefined variable, you'll get `null`. Set a variable to `null` to delete it.

~~~ lay
html {
  use 'env'

  Env::DEBUG = true
  debug: Env::DEBUG
  undefined: Env::THIS_ONE_SHOULD_NOT_EXIST
  Env::AN_EMPTY_STRING = ""
  empty: Env::AN_EMPTY_STRING
}
~~~

~~~ css
html {
  debug: "true";
  undefined: null;
  empty: '';
}
~~~

## License

[BSD-3-Clause](License.md)
