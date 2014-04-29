require 'sinatra/base'

class Application < Sinatra::Application

  def initialize(app=nil)
    super(app)

    # initialize any other instance variables for you
    # application below this comment. One example would be repositories
    # to store things in a database.

  end

  get '/' do
    erb :index
  end

  get '/animals' do
    animals = DB[:animals]
    erb :animals, :locals => {:animals => animals.to_a}
  end

  get '/animals/new' do
    erb :new
  end

  post '/animals' do
    animals = DB[:animals]
    animals.insert(:name => params[:name])
    redirect '/animals'
  end

end
