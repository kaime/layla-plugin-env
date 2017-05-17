# Layla Env plugin

Read environment variables from [Layla](//github.com/krokis/layla) code.

## Installation

Install as a dependency of your project with NPM:

~~~ sh
npm install layla-plugin-env --save # or --save-dev
~~~

## Usage

Require the plugin in your stylesheet. An `Env` object will be injected wherever you `use` the plugin. Use the `::` operator on it to read environment variables:

~~~ lay
// Use the plugin
use 'env'

// Read the `DEBUG` environment variable
$debug = Env::DEBUG

if $debug {
  body {
    border: 1px solid red
  }
}
~~~

All values are returned as strings. If you try to read an undefined variable, you'll get `null`.

~~~ lay
html {
  use 'env'

  undefined: Env::THIS_ONE_SHOULD_NOT_EXIST
}
~~~

~~~ css
html {
  undefined: null;
}
~~~

## License

[BSD-3-Clause](License.md)
