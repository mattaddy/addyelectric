require 'sinatra/base'
require 'sinatra/assetpack'
require 'sass'
require 'haml'

require File.join(File.dirname(__FILE__), 'app')

run AddyElectric::Application.new
