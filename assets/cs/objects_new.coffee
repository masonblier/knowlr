#
# /objects/new
#

$ ->
  # Here's my data model
  class View
    constructor: ()->
      @errors = ko.observable("")
      @name =  ko.observable("")
      @relations =  ko.observableArray([])

    addRelation: =>
      @relations.push(relation: "is_a", value: "thingy")

    save: (view, e) =>
      e.preventDefault()
      data = 
        name: @name()
        relations: @relations()
      console.log data
      req = $.ajax(
        url: '/api/objects',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(data),
        processData: false
      )
      req.done (data) ->
        window.location = '/objects/'+data._id
      req.fail (xhr, status, error) =>
        @errors(error)

  ko.applyBindings(new View())
