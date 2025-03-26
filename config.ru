require 'bundler/setup'
require 'sinatra/activerecord'
require './app'

run Sinatra::Application
