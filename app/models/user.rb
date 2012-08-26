class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
	cattr_accessor :current_user
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true

  has_many :rs_names, dependent: :destroy

  private

  	def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end

end
