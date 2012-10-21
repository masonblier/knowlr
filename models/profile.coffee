#
# Profile
#

Model = require 'mongo-model'

module.exports = class global.Profile extends Model
  @collection 'profiles'
