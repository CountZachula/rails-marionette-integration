@App.module "WeatherApp", (WeatherApp, App) ->

  WeatherApp.Controller =

    # Create layout and load default view.
    showDefault: ->
      @layout = new WeatherApp.Presenter.WeatherAppLayout()
      App.container.show(@layout)

      # Default to current conditions.
      @layout.on "show", =>
        @showCurrent()

    # Show current weather conditions.
    showCurrent: ->
      console.log 'showCurrent'
      # @currentItemView = new CurrentApp.View.CurrentItemView()
      # @layout.weatherContentRegion.show @currentItemView

    # Show forecast.
    showForecast: ->
      console.log 'showForecast'
    #   @forecastItemView = new ForecastApp.View.ForecastItemView()
      # @layout.weatherContentRegion.show @forecastItemView