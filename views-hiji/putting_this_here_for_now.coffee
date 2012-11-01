() ->
    # this actually uses mongo-model right now,
    # but i may extend it as i go, or make an
    # identical postgres version

    class User extends Model
      @collection 'users'

      @validate: (params, cb) =>
        errs = undefined
        unless params?["name"]?.length > 0
          (errs ?= {})["name"] = "Can't be blank"
        @errors = errs
        return !errs




    class App extends HijiApplication

      @mount "views"
      @mount "admin/views", on: "/admin"

      # this example mounts directories,
      # you can also mount specific files
      # it mounts them on their filename
      # without the ext. i should add a
      # custom linter which detects when
      # the class names don't match the
      # file names in some way
      



define ["hiji", "models"], (hiji, Models) ->

  class LoginView extends hiji.View

    initialize: () ->
      @$(".js-submit").on "click", =>
        Models.Session.login({ 
          username: @$(".js-username").val(), 
          password: @$(".js-password").val()
        }, @loginResult)


    index: () ->
      @tmpl "login/index"

    loginResult = (err, user) =>
      if hiji.current_user
        hiji.navigate "/"
      else
        $(".js-error").text("invalid username or password").show()

