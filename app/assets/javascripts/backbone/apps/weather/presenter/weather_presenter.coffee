@App.module "WeatherApp.Presenter", (Presenter, App, Backbone, Marionette, $, _) ->

  # Event constants.
  Presenter.raises =
    weatherFetch: "entities:weather:fetch"

  class Presenter.WeatherAppLayout extends Marionette.LayoutView
    template: "#weather_layout"
    regions:
      todayRegion: "#today-region"
      tomorrowRegion: "#tomorrow-region"

    events:
      "click #btn-refresh": "refreshClicked"

    initialize: (options)->
      options = options || {}

    onShow: ->
      @fetchWeather()

    fetchWeather: ->
      loadingView = new App.Common.Views.Loading
        title: "Loading Weather"
        message: "Please wait while we fetch weather conditions for you."
      @todayRegion.show(loadingView)

      fetchingConditions = App.request Presenter.raises.weatherFetch
      $.when(fetchingConditions)
        .done (data) =>
          todayTile = new App.TileApp.View.TileItemView
            title: "Today"
            model: App.Entities.conditions.models[0]
          @todayRegion.show todayTile

          tomorrowTile = new App.TileApp.View.TileItemView
            title: "Tomorrow"
            model: App.Entities.conditions.models[1]
          @tomorrowRegion.show tomorrowTile
        .fail (data) =>
          noDataView = new App.Common.Views.NoData
            title: "No Data"
            message: "Sorry, no weather data is available."
          @todayRegion.show noDataView

    refreshClicked: (event) ->
      @todayRegion.empty()
      @tomorrowRegion.empty()

      @fetchWeather()
