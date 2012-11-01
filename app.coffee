hiji = require 'hiji'

# this example mounts directories,
# you can also mount specific files
# it mounts them on their filename
# without the ext. i should add a
# custom linter which detects when
# the class names don't match the
# file names in some way
class App extends hiji.Application

  @mount hiji.client, on: "/libs/hiji"

  @mount "views"
  @mount "admin/views", on: "/admin", only: ['index']

(new App).serve()