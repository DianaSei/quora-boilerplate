class User < ActiveRecord::Base
# implement your Student model here
	validates :my_email, format: {with: /.*@.*\.../}, uniqueness: true
	has_secure_password
	has_many :questions 
	has_many :answers
	has_many :votes
end

