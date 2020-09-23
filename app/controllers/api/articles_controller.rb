class Api::ArticlesController < ApplicationController
  def index
    response = HTTP.get("https://newsapi.org/v2/everything?q=#{params[:search]}&apiKey=#{Rails.application.credentials.news_api[:api_key]}")
    data = response.parse
    articles = data["articles"]
    titles = articles.map { |article| article["title"] }

    response = HTTP.get("http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID=#{Rails.application.credentials.weather_api[:api_key]}")
    data = response.parse

    render json: { titles: titles, my_weather: data }
  end
end
