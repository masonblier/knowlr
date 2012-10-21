fs = require 'fs'

{print} = require 'sys'
{spawn} = require 'child_process'

require 'mongo-model/lib/sync'

run_proc = (command, args, callback) ->
  child = spawn command, args
  child.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  child.stdout.on 'data', (data) ->
    process.stdout.write data.toString()
  child.on 'exit', (code) ->
    callback() if code is 0 and callback?

watch = (callback) ->
  run_proc './node_modules/.bin/nodemon', ['app.js'], callback

sync_seed = ->
  db = require './config/db'
  db.clear()

  require("fs").readdirSync("./models").forEach((file)->
    require("./models/" + file)
  )
  require './config/seed'

  db.close()
  

seed = (callback) ->
  Fiber(sync_seed).run()

task 'watch', "Runs server that restarts on changes", -> watch()
task 'seed', "Clear and repopulate the database", -> seed()
