#
# Profile controller
#

app.get '/profiles', ->
  @profiles = Profile.limit(30).all()
  @eco 'profiles/index'

app.get '/profiles/:id', ->
  @profile = Profile.first(_id: @route.id)
  @eco 'profiles/show'
