@App.module "TileApp.View", (View, App) ->

  class View.TileItemView extends Marionette.ItemView
    template: "#tile"

    initialize: (options) ->
      options = options || {}
      @title = options.title || ""
      @high = options.model.high || 73
      @low = options.model.low || 62
      @status = options.model.status || App.Entities.weatherTypes.clear

    templateHelpers: ->
      {title: @title, high: @high, low: @low}