module AddyElectric
  class Application < Sinatra::Base
    set :root, File.dirname(__FILE__)
    set :haml, format: :html5

    register Sinatra::AssetPack

    assets do
      serve '/js',     from: File.join('assets', 'javascripts')
      serve '/css',    from: File.join('assets', 'stylesheets')
      serve '/images', from: File.join('assets', 'images')

      js  :app, ['/js/jquery.js', '/js/jquery*.js', '/js/app.js']
      css :app, ['/css/*.css']
    end

    get '/' do
      haml :index
    end
  end
end
