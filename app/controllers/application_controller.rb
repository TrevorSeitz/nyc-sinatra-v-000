class ApplicationController < Sinatra::Base
  require 'pry'
  register Sinatra::ActiveRecordExtension

  enable :sessions
  set :session_secret, "my_application_secret"

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/' do
    erb :'/landmarks/index'
  end
end
