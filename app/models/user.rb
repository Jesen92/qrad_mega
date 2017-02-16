class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, stretches: 14

  def self.create_with_password(attr={})
    generated_password = Devise.friendly_token.first(14)
    user = self.create(attr.merge(password: generated_password, password_confirmation: generated_password))
    Subscriber.find_by(email: user.email).destroy unless Subscriber.find_by(email: user.email).nil?

    UserMailer.generated_password(user, generated_password, I18n.locale.to_s).deliver_now


    puts "Veeam user: "+attr[:veeam_user].to_s
    UserMailer.no_veeam_user(user, I18n.locale.to_s).deliver_now unless attr[:veeam_user] == "true"

    #Informacije o user-u slane na megatrend mail
    UserMailer.user_information(user, I18n.locale.to_s).deliver_now

    user
  end

  def self.reset_password(attr={})
    generated_password = Devise.friendly_token.first(14)
    user = self.find_by(email: attr[:email])
    message = nil

    unless user.nil?
      if user.reset_password_sent_at.nil? || !user.reset_password_sent_at.today?
        user.update(password: generated_password, password_confirmation: generated_password)
        user.reset_password_sent_at = DateTime.now
        user.save
        UserMailer.reset_password(user, generated_password, I18n.locale.to_s).deliver_now
      else
        message = I18n.t('model.user.reset_password')
      end
    end

    if message != nil
      message
    elsif !user.nil?
      message = I18n.t('model.user.new_password')
      message
    else
      message = I18n.t('model.user.email_doesnt_exist')
      message
    end
  end
end
