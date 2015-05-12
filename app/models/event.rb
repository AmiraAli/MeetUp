class Event < ActiveRecord::Base
  belongs_to :user
  has_many :posts , :dependent => :delete_all
  has_many :users, through: :userevent, :dependent => :delete_all
  validates :title, :description, :startdate, :enddate, :country, :city, :address, :presence => true
  belongs_to :group
end
