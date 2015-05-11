class Group < ActiveRecord::Base
  geocoded_by :location, :latitude => :latitude , :longitude => :longitude
  belongs_to :user
  has_many :interests, through: :interestgroup
  has_many :users, through: :usergroup
  has_many :events


end
