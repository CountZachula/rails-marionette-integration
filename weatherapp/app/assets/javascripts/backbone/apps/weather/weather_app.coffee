@App.module "WeatherApp", (WeatherApp, App, Backbone, Marionette, $, _) ->

  API =
    showDefault: ->
      WeatherApp.Controller.showDefault()

  class WeatherApp.WeatherAppRouter extends Marionette.AppRouter
    appRoutes:
      "(/)": "showDefault"
    controller: API

  App.on "before:start", ->
    new WeatherApp.WeatherAppRouter
