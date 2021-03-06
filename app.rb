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

    get '/services/pool' do
      haml :'services/pools'
    end

    get '/resources/news' do
      haml :'resources/news'
    end

    get '/resources/articles' do
      haml :'resources/articles'
    end

    get '/resources/technical' do
      haml :'resources/technical'
    end

    get '/resources/links' do
      haml :'resources/links'
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

    get '/thanks' do
      haml :thanks
    end

    get '/privacy-policy' do
      haml :privacy_policy
    end

    get '/files/:type/:name' do
      type = %w[articles technical].include?(params[:type]) ? params[:type] : 'articles'
      path = "/home/deployer/files/#{type}/#{params[:name]}"
      if File.exists?(path)
        send_file path
      else
        status 404
      end
    end

    post '/inquire' do
      to = 'danny@addyelectric.com'
      email = params[:email]
      name = params[:name]
      subject = "Website: Solar inquiry from #{name}"
      body = "Danny,\n\n"
      body += "There has been an inquiry from addyelectric.com.\n\n"
      body += "Name: #{name}\n"
      body += "Email: #{email}\n"
      body += "City/Area: #{params[:city]}\n"
      body += "Utility Provider: #{params[:provider]}\n"
      body += "Avg. Bill or Kilowatt Hours: #{params[:avg]}"
      Pony.mail(to: to, from: 'system@addyelectric.com', subject: subject, body: body)
      redirect to('/thanks')
    end

    post '/contact' do
      to = 'danny@addyelectric.com'
      email = params[:email]
      name = params[:name]
      subject = "Website: Contact from #{name}"
      body = "Danny,\n\n"
      body += "There has been a message received from addyelectric.com.\n\n"
      body += "Name: #{name}\n"
      body += "Email: #{email}\n"
      body += "Phone: #{params[:phone]}\n"
      body += "Message: #{params[:message]}\n"
      Pony.mail(to: to, from: 'system@addyelectric.com', subject: subject, body: body)
      redirect to('/thanks')
    end
  end
end
