class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, stretches: 14

  has_many :users_services
  has_many :services, :through => :users_services

  def self.create_with_password(attr={})
    generated_password = Devise.friendly_token.first(14)
    user = self.create(attr.merge(password: generated_password, password_confirmation: generated_password))

    UserMailer.generated_password(user, generated_password).deliver_now

    user
  end

  def self.reset_password(attr={})
    generated_password = Devise.friendly_token.first(14)
    user = self.find_by(email: attr[:email])
    message = nil

    if !user.nil?
      if user.reset_password_sent_at.to_date != DateTime.now.to_date
        user.update(password: generated_password, password_confirmation: generated_password)
        user.reset_password_sent_at = DateTime.now
        user.save
        UserMailer.reset_password(user, generated_password).deliver_now
      else
        message = "Lozinka nije resetirana! Možete max 1 dnevno resetirati password!"
      end
    end

    if message != nil
      message
    elsif !user.nil?
      message = "Poslana vam je nova lozinka"
      message
    else
      message = "E-mail ne postoji!"
      message
    end
  end
end
