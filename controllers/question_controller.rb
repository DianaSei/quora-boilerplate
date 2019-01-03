get '/questions' do
	@questions = Question.all
	@questions.each do |id| 
  	p @questions.description
  end
  erb :"questions/index"
end



get '/questions/new' do
  erb :"questions/new"
end

post '/questions/new' do
  @question = Question.new(params[:question], user_id: current_user.id)
  	if @question.save
  		redirect "/users/#{current_user.id}"

  	else "Sorry your question was not saved, try one more time!"
	end
end

