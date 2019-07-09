
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

  post '/articles' do
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

  get '/articles/:id/edit' do
    @articles = Articles.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    Articles.update(params[:id], name: params[:name], content: params[:content])
    @articles = Articles.find(params[:id])
    erb :show
  end

  delete '/articles/:id/delete' do
    Articles.delete params[:id]
    redirect '/articles'
  end

end
