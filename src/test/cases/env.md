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

- Can write environment variables

  ~~~ lay
  use 'env'

  Env::BAR = baz
  Env::CORGE = 'corge!'.unquoted

  env.read {
    foo: Env::FOO
    bar: Env::BAR.quoted
    baz: Env::BAZ.unquoted
    qux: Env::QUX
    corge: Env::CORGE
  }
  ~~~

  ~~~ css
  env.read {
    foo: "foo";
    bar: "baz";
    baz: 25;
    qux: "";
    corge: corge!;
  }
  ~~~

- Can delete environment variables setting them to `null`

  ~~~ lay
  ~~~

  ~~~ css
  ~~~


