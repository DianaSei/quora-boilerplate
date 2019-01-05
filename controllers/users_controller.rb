

# ======== SIGN UP ===============

post '/signup' do
  user = User.new(params[:user])

  if user.save
    # what should happen if the user is saved?
    redirect "/signed_up"

  else
    # what should happen if the user keyed in invalid date?
     "Sorry your email or password is invalid! Try again!"
  end
end 

get '/signed_up' do
   	@date = DateTime.now.strftime("%D")
   	erb :"signed_up"
end

# ========= END SIGN UP ===================

# ========== LOGIN =======================

get '/login' do
	@date = DateTime.now.strftime("%D")
 	erb :"login"
end 

# get '/loged_in' do
# 	erb :"loged_in"
# end

post '/login' do
	# apply a authentication method to check if a user has entered a valid email and password
 	user = User.find_by(my_email: params[:email])
 	if user && user.authenticate(params[:password]) 
 		# p "Welcome back #{user.my_email}!"
		# session[:user_id] = user.id
		sign_in(user)
		redirect "/users/#{current_user.id}"

 	else p "Invalid email or password! Try again!"
 	end
	# if a user has successfully been authenticated, you can assign the current user id to a session
end

# =========== END LOGIN ===================

# ========== LOGOUT =====================
get '/logout' do
 	# kill a session when a user chooses to logout, for example, assign nil to a session
 	# session[:user_id] = nil
 	sign_out
 	# redirect to the appropriate page
 	redirect "/"
end

# ========== END LOGOUT ====================

# ========== PROFILE PAGE ===========

get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :"users/edit"
end

get '/users/:id' do
  @date = DateTime.now.strftime("%D")
  @user = current_user
  @answers = Answer.where(:user_id => @user.id )
  erb :"users/index"

end

post '/users/:id/edit' do
  # create @user variable
  # fix route to include params id (restful routes)

  @user = User.find(params[:id])
  # name = @user(params[:name])
  # name = params[:name]
  @user.update(full_name: params[:name])
  redirect "/users/#{current_user.id}"
end



# ========== END PROFILE PAGE ==========

