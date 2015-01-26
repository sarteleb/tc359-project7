# app.rb
require 'sinatra'

class MyWebApp < Sinatra::Base
  get '/' do
    "Copyright 2014-#{ Time.now.year } Brandon Sartele"
  end
end
