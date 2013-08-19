module AddyElectric
  class Application < Sinatra::Base
    set :root, File.dirname(__FILE__)
    set :haml, format: :html5
    set :scss, { load_paths: [ "#{settings.root}/assets/stylesheets" ] }

    register Sinatra::AssetPack

    assets do
      serve '/js',     from: File.join('assets', 'javascripts')
      serve '/css',    from: File.join('assets', 'stylesheets')
      serve '/images', from: File.join('assets', 'images')

      js  :app, ['/js/jquery.js', '/js/jquery.*.js', '/js/app.js']
      css :app, ['/css/*.css']
    end

    get '/' do
      haml :index
    end

    get '/services/electrical' do
      haml :'services/electrical'
    end

    get '/services/solar' do
      haml :'services/solar'
    end

    get '/services/pools' do
      haml :'services/pools'
    end

    get '/resources' do
      haml :resources
    end

    get '/about' do
      haml :about
    end

    get '/contact' do
      haml :contact
    end

    get '/why-ae' do
      haml :why
    end
  end
end
