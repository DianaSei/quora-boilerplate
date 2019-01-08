post '/questions/:question_id/answers/:id/votes' do
	@answer = Answer.find(params[:id])
	@questions = Question.find(params[:question_id])
	@vote = Vote.new(answer_id: params[:id], user_id: current_user.id)
		
		vote_count = @answer.votes.count

	if @vote.save 
		vote_count +=1
		{message: 'Successful', new_count: vote_count}.to_json
	else
		{message: 'Failed', new_count: vote_count}.to_json
	end
end


