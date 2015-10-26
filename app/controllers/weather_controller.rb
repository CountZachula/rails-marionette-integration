class WeatherController < ApplicationController

	respond_to :html, :json

	def index
	end

	def conditions
		# Fetch weather conditions and return.
		RestClient.get("http://api.openweathermap.org/data/2.5/forecast?q=tulsa,ok&appid=d1c22c98a4c01097b436b34c17a81dad") do |response, request, result, &block|
      case response.code
        when 200
          response[""]
          json = JSON.parse response
          @conditions = [json["list"][0], json["list"][3]]
          respond_with @conditions
      end
    end
	end

end
