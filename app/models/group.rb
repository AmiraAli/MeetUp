class Group < ActiveRecord::Base

  geocoded_by :location, :latitude => :latitude , :longitude => :longitude
  belongs_to :user
  has_many :interests, through: :interestgroup, :dependent => :delete_all
  has_many :users, through: :usergroup, :dependent => :delete_all
  has_many :events, :dependent => :delete_all

  include Paperclip::Glue
  belongs_to :user
  has_many :interests, through: :interestgroup, :dependent => :delete_all
  has_many :users, through: :usergroup, :dependent => :delete_all
  validates :groupname, presence: true,
                    length: { minimum: 5 }
  has_attached_file :avatar
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


end
