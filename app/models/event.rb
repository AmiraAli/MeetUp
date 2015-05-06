class Event < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  has_many :users, through: :userevent

end
