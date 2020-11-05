# Env plugin

- Can read environment variables

  ~~~ lay
  use 'env'

  env.read {
    foo: Env::FOO
    bar: Env::BAR.unquoted
    baz: Env::BAZ.unquoted
    qux: Env::QUX.quoted
  }
  ~~~

  ~~~ css
  env.read {
    foo: "foo";
    bar: bar;
    baz: 25;
    qux: "";
  }
  ~~~

- Returns `null` for undefined variables

  ~~~ lay
  use 'env'

  env.read {
    qux: Env::QUX.null?
    corge: Env::CORGE.null?
  }
  ~~~

  ~~~ css
  env.read {
    qux: false;
    corge: true;
  }
  ~~~
