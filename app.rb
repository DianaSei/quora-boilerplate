require_relative './config/init.rb'
set :run, true

get '/' do
  @name = "Diana Seidakhmetova"
  @date = DateTime.now.strftime("%D")
  erb :"home"
end

post '/signup' do
  user = User.new(params[:user])
  if user.save
    # what should happen if the user is saved?
    p "Congradulations! You have successfully signed up!"

  else
    # what should happen if the user keyed in invalid date?
    p "Sorry your email or password is invalid! Try again!"
  end
end  

# get 'users/:id' do
# 	@user = User.find(params[:id])
# 	erb :"users/home"

# end


