require "rubygems"
require "sinatra"

get "/skoly" do
  haml :skoly
end

get "/organy" do
  haml :organy
end

get "/clenstvi" do
  haml :clenstvi
end

get "/?" do
  haml :index
end