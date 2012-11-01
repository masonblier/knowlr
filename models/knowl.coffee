#
# Knowl
#

Model = require 'mongo-model'

module.exports = class global.Knowl extends Model
  @collection 'knowls'
