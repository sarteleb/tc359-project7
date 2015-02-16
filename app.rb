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
    while i <= daysInMonth[time.month]
      holiday = HolidApi.get(country: 'us', year: time.year, month: time.month, day: i)
      if  holiday[0] != nil
        holidayArray.push(holiday)
      end
      i += 1
    end
    i = 1
    while i <= daysInMonth[2]
      holiday = HolidApi.get(country: 'us', year: 1993, month: 2, day: i)
      if  holiday[0] != nil
        birthdayMonthArray.push(holiday)
      end
      if i == 24
        birthday = [{"name"=> "Brandon's Birthday (Yes it qualifies as a national holiday)", 'country'=> "US", 'date'=> "1993-02-24"}]
        birthdayMonthArray.push(birthday)
      end
      i += 1
    end
    @holidays = holidayArray
    @birthdayHolidays = birthdayMonthArray
    @time = time
    erb :index1
  end
end
