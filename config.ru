require 'sinatra/base'
require 'sinatra/assetpack'
require 'pony'
require 'sass'
require 'haml'

require File.join(File.dirname(__FILE__), 'app')

run AddyElectric::Application.new
