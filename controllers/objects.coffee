#
# Objects controller
#

app.get '/objects', ->
  @knowls = Knowl.limit(30).all()
  @eco 'objects/index'

app.get '/objects/new', ->
  @eco 'objects/new'

app.get '/objects/:id', ->
  @knowl = Knowl.first(_id: @route.id)
  console.log @knowl
  @eco 'objects/show'

app.post '/api/objects', ->
  knowl = Knowl.create(name: @params.name, properties: @params.properties)
  @json knowl