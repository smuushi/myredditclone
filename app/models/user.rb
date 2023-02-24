class User < ApplicationRecord
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true

  validates :password, length: {minimum: 4}, allow_nil: true
  attr_reader :password

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  #figvaperb
  #gerb
  def self.find_by_credentials(username,password)
    @user = User.find_by(username: username)
    @user && @user.is_password?(password) ? @user : nil 
  end

  def is_password?(password)
    bcrypt_obj = BCrypt::Password.new(password)
    bcrypt_obj.is_password?(password)
  end

  def generate_unique_session_token
    token = SecureRandom.urlsafe_base64(16)
    while User.exists?(session_token: token)
      token = SecureRandom.urlsafe_base64(16)
    end
    token
  end

  
end