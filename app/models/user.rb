class User < ActiveRecord::Base
validates :username,presence: true, length: { maximum: 10 }
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness:{case_sensitive: false }
has_secure_password

 validates :password, length: { minimum: 6 }
validates :gender,presence: true
validates :age,presence: true
validates :country,presence: true
validates :city,presence: true
validates :photo,presence: true
attr_accessor :country_code


GENDERS = ["female","male"]
has_attached_file :photo
validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	has_many :comments, :dependent => :delete_all
	has_many :events, :dependent => :delete_all
	has_many :groups, :dependent => :delete_all
	has_many :interests, :dependent => :delete_all
	has_many :posts, :dependent => :delete_all
	has_many :events, through: :userevent , :dependent => :delete_all
 has_many :groups, through: :usergroup, :dependent => :delete_all



    def self.omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.name
      user.photo = auth.info.photo
      user.token = auth.credentials.token
      user.expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end



end
