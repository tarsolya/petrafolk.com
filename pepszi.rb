# encoding: utf-8
# Petra Folk's Portfolio

require 'rubygems'
require 'sinatra'
require 'pathname'
require 'logger'
require 'haml'

# Logger
$LOG = Logger.new('logs/pepszi.log')
$LOG.level = Logger::INFO

# Actions
get '/' do
  view :index
end

get '/portfolio/experimental' do
  view :experimental
end

get '/portfolio/flash' do
  view :flash
end

get '/portfolio/graphics' do
  view :graphics
end

get '/portfolio/logos' do
  view :logos
end

get '/portfolio/offline' do
  view :offline
end

get '/portfolio/photos' do
  view :photos
end

get '/portfolio/web' do
  view :web
end


# Helpers
helpers do
  def view(view)
    haml view
  end
end