class Group < ActiveRecord::Base
  include Paperclip::Glue
  belongs_to :user
  has_many :interests, through: :interestgroup
  has_many :users, through: :usergroup
  validates :groupname, presence: true,
                    length: { minimum: 5 }
  has_attached_file :avatar
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
