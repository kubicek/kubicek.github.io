require 'rubygems'
require 'sinatra'

Sinatra::Default.set(:run, false)
Sinatra::Default.set(:env, ENV['RACK_ENV'])
Sinatra::Default.set(:views, './views')

require 'kubicek'
run Sinatra::Application
