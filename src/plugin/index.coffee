Layla = require 'layla'

###
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

  ###
  ###
  '.::=': (right, value) ->
    if value.isNull()
      delete process.env[name]
    else
      process.env[name] = value.toString()

class EnvPlugin extends Layla.Plugin

  ###
  ###
  use: (context) ->
    context.set 'Env', new EnvObject

module.exports = EnvPlugin
