require "rubygems"
require "sinatra"

get "/kdo-jsem/?" do
  erb :about
end

get "/temata/?" do
  erb :tags
end

get "/galerie/?" do
  erb :gallery
end

get "/kontakt/?" do
  erb :contact
end

get "/?" do
  erb :index
end