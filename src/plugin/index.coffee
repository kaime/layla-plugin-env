process = require 'process'

Layla =
  Object:       require 'layla/lib/object'
  Null:         require 'layla/lib/object/null'
  String:       require 'layla/lib/object/string'
  QuotedString: require 'layla/lib/object/string/quoted'
  Plugin:       require 'layla/lib/plugin'
  ValueError:   require 'layla/lib/error/value'


###
TODO Make it `Enumerable` so it can be iterated.
###
class EnvObject extends Layla.Object

  ###
  ###
  '.::': (context, name) ->
    name = name.toString()

    if name of process.env
      return new Layla.QuotedString process.env[name]
    else
      return Layla.Null.null


# This is a singleton
ENV = new EnvObject

class EnvPlugin extends Layla.Plugin

  ###
  ###
  use: (context) ->
    context.set 'Env', ENV

module.exports = EnvPlugin
