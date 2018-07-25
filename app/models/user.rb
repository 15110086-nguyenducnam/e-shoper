class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_writer :login

  #validates
  validate :validate_username

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable,
          :validatable, authentication_keys: [:login]
  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def self.new_with_session params, session
    super.tap do |user|
      if data = session["devise.facebook_data"] &&
        session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendlyfind_first_by_auth_conditions_token[0,20]
      user.name = auth.info.name
    end
  end

  # login by email and name
  def login
    @login || self.username || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  # reset password
  def self.valid_login?(email, password)
    user = where(email: email).first
    [user&.valid_password?(password), user]
  end

  def reset_authentication_token!
    update_column(:authentication_token, Devise.friendly_token)
  end

end
