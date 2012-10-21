#
# Sessions controller
#

crypto = require 'crypto'

sha256 = (str) -> crypto.createHash('sha256').update(str).digest('hex')

app.get '/login', ->
  @eco 'sessions/login'

app.post '/login', ->
  if @params?.register
    @username = @params?.username
    @eco 'sessions/register'
  else
    if @params?.username?
      user = User.first(username: @params.username, passhash: sha256(@params.password))
      if user
        delete user.passhash
        @session.user = user
        @redirect '/'
    @error = "Incorrect Login"
    @eco 'sessions/login'

app.route '/register', ->
  @errors = []
  if @params?.username?
    @errors.push "Username is taken" if User.find(username: @params.username).count() > 0
    @errors.push "Password must be at least 6 characters" unless @params.password?.length > 5
    @errors.push "Password must match" unless @params.password == @params.passwordConfirm
  unless @errors.length > 0
    user = User.create username: @params.username, passhash: sha256(@params.password)
    if user
      @session.user = user
      @redirect '/'
  @eco 'sessions/register'

app.get '/logout', ->
  @session.user = undefined
  @redirect '/'
