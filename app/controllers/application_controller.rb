
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/articles/new' do
    erb :new
  end

  posts '/articles' do
      Articles.create(params)
      redirect '/Articles'
  end

  get '/articles' do
    @articles = Articles.all
    erb :index
  end

  get '/articles/:id' do
    @articles = Articles.find(params[:id])
    erb :show
  end

end
