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

class Gallery
  
  def initialize( image_path )
    @relative_path = image_path
    @path = Pathname.pwd.to_s + '/public' + image_path
    @directory = Pathname.new( @path )
  end
  
  def entries
    @directory.entries.select { |e| e.to_s != "." && e.to_s != ".." && (e.to_s.match(/\.jpg/) || e.to_s.match(/\.png/)) }.collect { |e| @relative_path + "/" + e.to_s }
  end
  
end

# Actions
get '/' do
  view :index
end

get '/portfolio/experimental' do
  @coctail = Gallery.new( '/images/experimental/coctail' )
  @fashion = Gallery.new( '/images/experimental/fashion' )
  @ladies = Gallery.new( '/images/experimental/toalet' )
  view :experimental
end

get '/portfolio/flash' do
  view :flash
end

get '/portfolio/graphics' do
  @graphics = Gallery.new( '/images/graphics/graphics' )
  view :graphics
end

get '/portfolio/logos' do
  view :logos
end

get '/portfolio/offline' do
  view :offline
end

get '/portfolio/photos' do
  @photos = Gallery.new( '/images/photos/photos' )
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