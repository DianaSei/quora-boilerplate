class Answer < ActiveRecord::Base
# implement your Answer model here
	belongs_to :user
	belongs_to :question
	has_many :votes
end