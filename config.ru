require 'rubygems'
gem 'sinatra', '=0.3.2'
require 'sinatra'

ROOT_DIR = File.expand_path(File.dirname(__FILE__))

Sinatra::Application.default_options.merge!(
  :views    => File.join(ROOT_DIR, 'views'),
  :app_file => File.join(ROOT_DIR, 'kubicek.rb'),
  :run      => false
)

run Sinatra.application
