
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
      Post.create(params)
      redirect '/Articles'
  end

  get '/posts' do
    @articles = Articles.all
    erb :index
  end

  get '/posts/:id' do
    @articles = Articles.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @articles = Articles.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    Articles.update(params[:id], name: params[:name], content: params[:content])
    @articles = Articles.find(params[:id])
    erb :show
  end

  delete '/posts/:id/delete' do
    Articles.delete params[:id]
    redirect '/articles'
  end

end
