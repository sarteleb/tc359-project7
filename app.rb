# app.rb
require 'sinatra'
require 'cat_api'
require 'holidapi'


class MyWebApp < Sinatra::Base
  get '/' do
    daysInMonth = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    time = Time.new
    holidayArray = []
    birthdayMonthArray = []
    i = 1
    if(params.any?)
      while i <= daysInMonth[params['month'].to_i]
        holiday = HolidApi.get(country: params['country'], year: params['date'], month: params['month'], day: i)
        if  holiday[0] != nil
          holidayArray.push(holiday)
        end
        i += 1
      end
    end
    @holidays = holidayArray
    erb :index1
  end
end
