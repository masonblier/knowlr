#
# /objects/new
#

$ ->
  $(".dropdown").on "click", "input", (e)->
    e.stopPropagation();
    e.preventDefault();
    false

  # Here's my data model
  class View
    constructor: ()->
      @errors = ko.observable("")
      @name =  ko.observable("")
      @properties =  ko.observableArray([])

    addProperty: =>
      @properties.push(relation: "is_a", value: "thingy")

    is_valid: () => @is_name_valid()
    is_name_valid: () => @name().length > 0

    save: (view, e) =>
      e.preventDefault()
      data = 
        name: @name()
        properties: @properties()
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
        @errors(xhr.responseText)

  ko.applyBindings(new View())
