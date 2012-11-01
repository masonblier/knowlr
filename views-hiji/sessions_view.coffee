
hiji = require 'hiji'

module.exports = class SessionsView extends hiji.View

  initialize: () ->
    @$(".js-submit").on "click", =>
      Models.Session.login({ 
        username: @$(".js-username").val(), 
        password: @$(".js-password").val()
      }, @loginResult)

  login: () ->
    @tmpl "sessions/login"

  loginResult = (err, user) =>
    if hiji.current_user
      hiji.navigate "/"
    else
      $(".js-error").text("invalid username or password").show()
