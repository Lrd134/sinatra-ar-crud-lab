
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/articles" do
    erb :index
  end
  get "/articles/:id/edit" do
    @a = Article.find(params["id"])
    erb :'/articles/update'
  end
  get "/articles/new" do
    erb :'articles/new'
  end

  
  get "/articles/:id" do
    @article = Article.find(params["id"])
    erb :'articles/show'
  end

  post "/articles" do
    a = Article.new(params)
    a.save
    redirect :"/articles/#{a.id}"
  end
  patch "/articles/:id" do
    a = Article.find(params["id"])
    a.update(params["article"])
    redirect "/articles/#{a.id}"
  end
  delete "/articles/:id" do
    Article.destroy(params["id"])
    redirect "/articles"
  end
end
