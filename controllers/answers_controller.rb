# ========= Answer =============

get '/questions/:id/answers/new' do
	@questions = Question.find(params[:id])
	erb :"answers/new"
end

post '/questions/:id/answers/new' do
	@questions = Question.find(params[:id])
 	@answers = Answer.new(description: params[:answer], user_id: current_user.id, question_id: @questions.id )
  	if @answers.save
  		redirect "questions/#{@questions.id}"
  	else "Sorry your answer was not saved, try one more time!"
	end
end
# ========= End of an Answer ====

# ========= Delete an Answer ============

get '/questions/:question_id/answers/:id/delete' do
	@answers = Answer.find(params[:id])
	@question = Question.find(params[:question_id])
	erb :"answers/destroy"
end

delete '/questions/:question_id/answers/:id/delete' do
	@answers = Answer.find(params[:id])
	if @answers.delete
		redirect "questions/#{params[:question_id]}"
	else "Sorry, your answer was not deleted, try one more time!"	
	end
end

# ========= End of Delete an Answer =====

get '/user/:user_id/answers/:id' do
	@user = User.find(params[:user_id])
	@answer = Answer.find(params[:id])
	@question = Question.find(id = @answer.question_id)
  		if @question.id == @answer.question_id
			redirect "questions/#{@question.id}"
		end
	
end

# ========= Update an Answer ==========

 patch '/questions/:question_id/answers/:id/update' do
	
	@answers = Answer.find(params[:id])
	@question = Question.find(params[:question_id])
	@answers.update(description: params[:updated_answer])
	redirect "questions/#{params[:question_id]}"
end

# ========== End of Update an Asnwer========












