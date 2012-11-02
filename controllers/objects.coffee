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
  knowl = new Knowl(name: @params.name, properties: @params.properties)
  if knowl.valid()
    knowl.save()
    @json knowl
  else
    @status = 422
    errors = knowl.errors()
    @body = ("#{field} #{errors[field]}" for field of errors).join "\n"