class Event < ActiveRecord::Base
  belongs_to :user
  has_many :posts , :dependent => :destroy
  has_many :users, through: :userevent
  validates :title, :description, :startdate, :enddate, :country, :city, :address, :presence => true
  belongs_to :group
end
