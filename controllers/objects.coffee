#
# Objects controller
#

app.get '/objects', ->
  @knowls = Knowl.limit(30).all()
  @eco 'objects/index'

app.get '/objects/:id', ->
  @knowl = Knowl.first(_id: @route.id)
  @eco 'objects/show'
