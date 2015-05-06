class User < ActiveRecord::Base
	has_many :comments
	has_many :events
	has_many :groups
	has_many :interests
	has_many :posts
	has_many :events, through: :userevent
    has_many :groups, through: :usergroup

end
