class Question < ActiveRecord::Base
# implement your Question model here
	belongs_to :user
	has_many :answers
	has_many :votes
end