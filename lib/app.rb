require 'sinatra/base'
require 'sinatra'
require_relative "./model/greeter"
require 'stripe'
ENV['SECRET_KEY'] = "sk_test_51HhnLmJgx7WFG8VYXHIgNqMgeJZvwsPeMD6PYKEnDgEXwaH21498gHqLBcIZjSdonaUiKY8Z58JTijArSB341KgW0082E8WCqt"
class SampleApp < Sinatra::Base
enable :sessions
set :publishable_key, ENV['PUBLISHABLE_KEY']
set :secret_key, ENV['SECRET_KEY']

Stripe.api_key = settings.secret_key

error Stripe::CardError do
  env['sinatra.error'].message
end

  get "/" do
    # @greeter =  Greeter.new
    erb :index
  end

  post '/charge' do
  # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create({
      email: params[:email],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      amount: @amount,
      description: 'Sinatra Charge',
      currency: 'gbp',
      customer: customer.id,
    })
    redirect '/success'
  end

  get '/success' do
    erb :charge
  end






  post "/submit" do
    time = Time.new
    session[:name] = params[:name]
    session[:day] = params[:day]
    session[:month] = params[:month]
    if time.day.to_s == session[:day] && time.month.to_s == session[:month]
      redirect "/happy_birthday"
    else
      redirect "/sorry_not_today"
    end
  end

  get "/happy_birthday" do
    @name = session[:name]
    erb :happy_birthday
  end

  get "/sorry_not_today" do
    time = Time.new
    @name = session[:name]
    @day = session[:day]
    @month = session[:month]
    erb :sorry_not_today
  end

  run! if app_file == $0

end
