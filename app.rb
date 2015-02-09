# app.rb
require 'sinatra'

class MyWebApp < Sinatra::Base
  get '/' do
    erb :"index#{ rand(3) + 1 }"
  end
end
