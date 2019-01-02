class User < ActiveRecord::Base
# implement your Student model here
	validates :my_email, format: {with: /.*@.*\.../}, uniqueness: true
	has_secure_password
end

