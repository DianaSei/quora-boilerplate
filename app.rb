require_relative './config/init.rb'
set :run, true
set :sessions => true

get '/' do
  @name = "Diana Seidakhmetova"
  @date = DateTime.now.strftime("%D")
  erb :"home"
end

post '/signup' do
  user = User.new(params[:user])

  if user.save
    # what should happen if the user is saved?
    redirect "/signed_up"

  else
    # what should happen if the user keyed in invalid date?
    p "Sorry your email or password is invalid! Try again!"
  end
end 


get '/signed_up' do
   	@date = DateTime.now.strftime("%D")
   	erb :"signed_up"
end


get '/login' do
	@date = DateTime.now.strftime("%D")
 	erb :"login"
end 



get '/loged_in' do
	erb :"loged_in"
end


post '/login' do
	# apply a authentication method to check if a user has entered a valid email and password
 	user = User.find_by(my_email: params[:email])
 	if user && user.authenticate(params[:password]) 
 		# p "Welcome back #{user.my_email}!"
		# session[:user_id] = user.id
		sign_in(user)
		redirect "/loged_in"

 	else p "Invalid email or password! Try again!"
 	end
	# if a user has successfully been authenticated, you can assign the current user id to a session
end

post '/logout' do
 	# kill a session when a user chooses to logout, for example, assign nil to a session
 	# session[:user_id] = nil
 	sign_out
 	# redirect to the appropriate page
 	redirect "/"
end

get 'users/:id' do
	@user = User.find(params[:id])
	erb :"users/home"

end


