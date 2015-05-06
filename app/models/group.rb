class Group < ActiveRecord::Base
  belongs_to :user
  has_many :interests, through: :interestgroup
  has_many :users, through: :usergroup


end
