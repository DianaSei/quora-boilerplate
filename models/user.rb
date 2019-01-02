class User < ActiveRecord::Base
# implement your Student model here
	validates :my_email, format: {with: /.*@.*\.../}
	validates :my_email, uniqueness: true
	has_secure_password
end