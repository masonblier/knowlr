#
# Account controller
#

app.get '/account', ->
  unless @session.user
    @redirect '/login'
  else
    @account = User.first(_id: @session.user._id)
    @eco 'account/index'

app.get '/profiles/:id', ->
  @profile = Profile.first(_id: @route.id)
  @eco 'profiles/show'
