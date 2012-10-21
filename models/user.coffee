#
# User
#

Model = require 'mongo-model'

module.exports = class global.User extends Model
  @collection 'users'

  @validate: (params, cb) =>
    errs = undefined
    unless params?["name"]?.length > 0
      (errs ?= {})["name"] = "Can't be blank"
    @errors = errs
    return !errs
