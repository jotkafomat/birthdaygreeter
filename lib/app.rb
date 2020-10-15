require 'sinatra/base'
require_relative "./model/greeter"

class SampleApp < Sinatra::Base

  get "/" do
    @greeter =  Greeter.new
    erb :index
  end

  run! if app_file == $0
end
