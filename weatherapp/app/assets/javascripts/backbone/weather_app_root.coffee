@App = do(Backbone, Marionette) ->
  WeatherApp = new Marionette.Application

  WeatherApp.addRegions
    container: "#container-region"

  WeatherApp.on 'before:start', ->
    WeatherApp.weather = {}
    # WeatherApp.weather = WeatherApp.request('entities:weather:current')

  WeatherApp.on "start", ->
    if Backbone.history
      Backbone.history.start(pushState: false)
  WeatherApp

$(document).ready ->
  App.start();
