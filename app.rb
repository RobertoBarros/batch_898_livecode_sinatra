require 'date'
require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/activerecord"
require "pry-byebug"
require "better_errors"
require_relative "config/application"

get "/" do
  @restaurants = Restaurant.all
  erb :index
end

get "/restaurants/:id" do
  id = params[:id]
  @restaurant = Restaurant.find(id)
  erb :show
end

get "/new_restaurant" do
  erb :new
end

post '/restaurants' do
  name = params[:name]
  city = params[:city]
  Restaurant.create(name: name, city: city)
  redirect '/'
end
