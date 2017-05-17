Layla =
  Object       : require 'layla/object'
  String       : require 'layla/object/string'
  QuotedString : require 'layla/object/string/quoted'
  Plugin       : require 'layla/plugin'
  TypeError    : require 'layla/error/type'

###
TODO Maybe it should implement `Enumerable` so it can be iterated.
###
class EnvObject extends Layla.Object

  ###
  ###
  '.::': (right) ->
    if right instanceof Layla.String
      if name of process.env
        new Layla.QuotedString process.env[name]
      else
        Layla.Null.null
    else
      throw new Layla.TypeError


# This is a singleton
ENV = new EnvObject

class EnvPlugin extends Layla.Plugin

  ###
  ###
  use: (context) ->
    context.set 'Env', ENV

module.exports = EnvPlugin
