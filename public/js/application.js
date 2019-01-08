$('.vote-btn').click(function(event){
	event.preventDefault();
	var questionId = event.target.id
	var answerId = event.target.value 
	// console.log(answerId)
	
	$.ajax({
		method: 'POST', 
		url: `/questions/${questionId}/answers/${answerId}/votes`,
		dataType: 'JSON',
		success: function(data){
			if(data.message == 'Successful'){
				$(`.vote-count-${answerId}`).html(`Vote count: ${data.new_count}`)
			}else if (data.message == 'Failed'){
				alert('You have already voted!')
	}
			},
			error: function(errors){
				console.log(errors)
		}
	});

});