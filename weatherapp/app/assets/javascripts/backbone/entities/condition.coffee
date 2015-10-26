@App.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  Entities.weatherTypes =
    clear: "Clear"
    clouds: "Clouds"
    rain: "Rain"

  class Entities.Condition extends Backbone.Model
    initialize: (options) ->
      options = options || {}
      @high = (@convertKtoF(options.main.temp_max)) || 73
      @low = (@convertKtoF(options.main.temp_min)) || 62
      @status = options.weather.main || Entities.weatherTypes.clear

    convertKtoF: (tempK) ->
      tempF = parseInt( ((tempK - 273.15) * 1.8 + 32) , 10)
      tempF

  class Entities.Conditions extends Backbone.Collection
    model: Entities.Condition

    initialize: (models, options) ->
      options = options || {}

    url: ->
      "/conditions.json"

  API =
    generateFetchPromise: (opts) ->
      # Prepare promise.
      defer = $.Deferred()

      # Define if not already.
      if Entities.conditions == undefined
        Entities.conditions = new Entities.Conditions []

      # Fetch conditions.
      Entities.conditions.fetch
        data: opts.data
        success: ->
          defer.resolve(Entities.conditions)
      defer.promise()

    fetchConditions: (options) ->
      if opts == null || opts == undefined
        opts = {}
        opts.data = {}
      @generateFetchPromise(opts)

  # reqres handlers.
  App.reqres.setHandler "entities:weather:fetch", (opts) ->
    API.fetchConditions(opts)
