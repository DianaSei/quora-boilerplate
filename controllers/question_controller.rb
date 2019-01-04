# ========= Home page for questions =======

get '/questions' do
	@questions = Question.all
  erb :"questions/index"
end

get '/my_questions' do
	@questions = Question.where(:user_id => current_user.id)
	erb :"questions/index"
end

# ========== End of Home page ===========

# ========== Add a new question ===========

get '/questions/new' do
 	erb :"questions/new"
end

post '/questions/new' do
 	@question = Question.new(description: params[:question], user_id: current_user.id)
  	if @question.save
  		redirect "questions"

  	else "Sorry your question was not saved, try one more time!"
	end
end

# =========== End of Add a new question ============

# =========== Show a question ============

get '/questions/:id' do
	@questions = Question.find(params[:id])
	erb :"questions/show"
end

# ============ End of Show a question =============

# ============ Delete a question =============

delete '/questions/:id/delete' do
	@questions = Question.find(params[:id])
	if @questions.user_id != current_user.id
		"Sorry, you are not able to delete other people's questions!"
	else
		@question = Question.find(params[:id])
		if @question.delete
			redirect "my_questions"
		else "Sorry, your question was not delted, try one more time!"
		end
	end
end

# ========= End of Delete a question ========

# ========== Update a question ==============

get '/questions/:id/update' do
  @question_to_update = Question.find(params[:id])
  erb :"questions/update"
end


patch '/questions/:id/update' do
	@questions = Question.find(params[:id])
	if @questions.user_id != current_user.id
		"Sorry, you are not able to edit other people's questions!"
	else
		@questions.update(description: params[:question])
			redirect "my_questions"
	end
end

# =========== End of Update a question =========





