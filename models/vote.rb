class Vote < ActiveRecord::Base
# implement your Student model here
	validates :answer_id, uniqueness: {scope: :user}
	
	belongs_to :question 
	belongs_to :answer
	belongs_to :user

	

end