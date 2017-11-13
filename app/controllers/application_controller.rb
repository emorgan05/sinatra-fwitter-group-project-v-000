require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, Proc.new { File.join(root, "../views/") }
  end

  get '/' do
    erb :index
  end

  get '/tweets/new' do
    erb :'tweets/new'
  end

  post '/tweets' do
    @tweet = Tweet.create(params[:tweet])

    redirect "/tweets/#{@tweet.id}"
  end

  get '/tweets/:id/edit' do
    @tweet = Tweet.find(params[:id])

    erb :'/tweets/edit'
  end

  patch '/tweets/:id' do
    @tweet = Tweet.find(params[:id])
    @tweet.update(params[:tweet])

    redirect "/tweets/#{@tweet.id}"
  end

  get '/tweets/:id' do
    erb :'/tweets/show'
  end

end
