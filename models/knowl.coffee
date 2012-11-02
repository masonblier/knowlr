#
# Knowl
#

Model = require 'mongo-model'

module.exports = class global.Knowl extends Model
  @collection 'knowls'

  @validate (cb) ->
    if not @name?.length > 0
      @errors().add name: "can't be empty"
    cb()
