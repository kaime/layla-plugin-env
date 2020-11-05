# 3rd party
fs           = require 'fs-extra'
which        = require 'which'
childProcess = require 'child_process'
coffee       = require 'coffee-script'

QUEUE = []

log = (type = '', text = '') ->
  console.log text

next = ->
  if QUEUE.length
    QUEUE[0]()

queue = (func) ->
  QUEUE.push func
  if QUEUE.length is 1
    next()

done = ->
  log 'ok', 'Done'
  log()
  QUEUE.shift()
  next()

mkdir = (path, callback = ->) ->
  fs.stat path, (err, stat) ->
    if err
      fs.mkdirsSync path
    else unless stat.isDirectory()
      throw new Error "Cannot make directory #{path}: file exists"

    callback()

exec = (cmd,  callback = ->) ->
  args = cmd.split /\s+/
  cmd = args.shift()
  wcmd = which.sync cmd

  child = childProcess.spawn wcmd, args, stdio: 'inherit'

  child.on 'exit', (status) ->
    if status is 0
      callback()
    else
      console.error(
        "Command #{cmd} did not exited nicely (#{status})"
      )

test = ->
  args = [
    '--slow 500'
    '--timeout 10000'
    '--reporter spec'
    '--require coffeescript/register'
  ]

  path = "src/test/index.coffee"

  exec "mocha #{args.join ' '} #{path}", done

task 'build', 'Build plugin', ->
  console.log 'Building plugin'

  exec "coffee --compile --no-header --output ./ src/plugin"

task "test:cases", "Run test cases", ->
    queue ->
      log 'task', "Running test cases"
      test 'cases'
