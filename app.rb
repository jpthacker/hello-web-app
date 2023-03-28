require "sinatra/base"
require "sinatra/reloader"

class Application < Sinatra::Base
    # This allows the app code to refresh
    # without having to restart the server.

    get '/hello' do
        erb(:hello)
    end

    get '/names' do
        names = params[:names]
        return names.gsub(',', ', ')
    end

    post '/submit' do
        name = params[:name]
        message = params[:message]

        "Thanks #{name}, you sent this message: #{message}"
    end

    post '/sort-names' do
        names = params[:names]

        sorted_names = names.split(',').sort.join(',')
        sorted_names
    end

    configure :development do
        register Sinatra::Reloader
    end
end
