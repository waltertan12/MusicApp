# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_reader :password

  validates :email, :password_digest, :session_token, presence: true 
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }, allow_nil: true

  after_initialize :ensure_session_token
  before_create    :generate_activation_token

  has_many :notes

  def User.find_by_credentials(email, password)
    user = User.find_by(email: email)
    user if user && user.is_password?(password)
  end

  def User.generate_token
    SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = User.generate_token
    self.save!
  end

  def ensure_session_token
    self.session_token ||= User.generate_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def generate_activation_token
    self.activation_token = User.generate_token
  end

  def activate_user
    self.updated_at = Time.now
    self.activated  = true
  end
end
