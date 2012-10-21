
Model = require 'mongo-model'
Driver = require 'mongo-model/lib/driver'

require 'mongo-model/lib/sync'

# configure database driver
Driver.configure
  databases:
    default:
      name: 'knowlr_development'
      host: 'localhost'

# Connecting to default database and clearing it before starting.
module.exports = db = Model.db("default")

# Close connection
# db.close()

