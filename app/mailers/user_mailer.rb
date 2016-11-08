class UserMailer < ApplicationMailer
  default from: 'vcc@megatrend.com'

  def generated_password(user, generated_password)
    @user = user
    @generated_password = generated_password

    mail(to: @user.email, subject: "Account Details")
  end

  def reset_password(user, generated_password)
    @user = user
    @generated_password = generated_password

    mail(to: @user.email, subject: "Account Details", template_path: 'user_mailer', template_name: 'reset_password')
  end

  def send_calculated_services(user)
    #TODO slanje mail-a kalkulacije
  end
end
