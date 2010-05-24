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

def load_web_galleries
  @szoba = Gallery.new( '/images/web/4szoba' )
  @sixmm = Gallery.new( '/images/web/6mm' )
  @bg_cotcot_first = Gallery.new( '/images/web/bg_cotcot_2' )
  @bg_cotcot_second = Gallery.new( '/images/web/bg_cotcot_1' )
  @bg_hg = Gallery.new( '/images/web/bg_hg' )
  @foodmatters = Gallery.new( '/images/web/foodmatters' )
  @heyho = Gallery.new( '/images/web/heyho' )
  @mammut = Gallery.new( '/images/web/mammut' )
  @ombrello = Gallery.new( '/images/web/ombrello' )
  @kari = Gallery.new( '/images/web/origo' )
  @parentia = Gallery.new( '/images/web/parentia' )
end

# Actions
get '/' do
  load_web_galleries
  view :web
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
  @logos = Gallery.new( '/images/logos/logos' )
  view :logos
end

get '/portfolio/offline' do
  @bizcot = Gallery.new( '/images/offline/bizcot' )
  @bizomb = Gallery.new( '/images/offline/bizomb' )
  @book = Gallery.new( '/images/offline/book' )
  @flyers = Gallery.new( '/images/offline/flyers' )
  @textile = Gallery.new( '/images/offline/textile' )
  @tshirt = Gallery.new( '/images/offline/tshirt' )
  @xmas = Gallery.new( '/images/offline/xmas' )
  
  view :offline
end

get '/portfolio/photos' do
  @photos = Gallery.new( '/images/photos/photos' )
  view :photos
end

get '/portfolio/web' do
  load_web_galleries
  view :web
end


# Helpers
helpers do
  def view(view)
    haml view
  end
end