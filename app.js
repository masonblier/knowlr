// App server

var App = require('ace').App

var app = new App;
global.app = app;

// makes all the models global and loads controller routes.
// should be moved to the /ace repo at some point once this
// is more flushed out
var sync = function() {
  global.db = require('./config/db.coffee');
  require("fs").readdirSync("./models").forEach(function(file){
    require("./models/" + file)
  });
  app.get('/cs*', function(){
    return this.coffee(this.request.env.pathInfo.substr(1));
  });
  require("fs").readdirSync("./controllers").forEach(function(file){
    require("./controllers/" + file)
  });
};

// This stuff needed for synchronous mode.
Fiber(sync).run();

app.serve({
  port: process.env.PORT || 1982
});
