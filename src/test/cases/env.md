# Env plugin

- Can read environment variables

  ~~~ lay
  use 'env'

  env.read {
    foo: Env::FOO
    bar: Env::BAR.unquoted
    baz: Env::BAZ.unquoted
    qux: Env::QUX
    corge: Env::CORGE
  }
  ~~~

  ~~~ css
  env.read {
    foo: "foo";
    bar: bar;
    baz: 25;
    qux: "";
    corge: null;
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
  env.read[undefined] {
    qux: false;
    corge: true;
  }
  ~~~

