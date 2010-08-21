require 'rubygems'
require 'sinatra'

Sinatra::Base.set(:run, false)
Sinatra::Base.set(:env, ENV['RACK_ENV'])
Sinatra::Base.set(:views, './views')

require 'kubicek'
run Sinatra::Application
