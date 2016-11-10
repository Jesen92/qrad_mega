class UserMailer < ApplicationMailer
  default from: 'vcc@megatrend.com'

  def generated_password(user, generated_password, locale)
    @user = user
    @generated_password = generated_password

    if locale == "hr"
      mail(to: @user.email, subject: "Account Details", template_path: 'user_mailer', template_name: 'generated_password_hr')
    else
      mail(to: @user.email, subject: "Account Details")
    end
  end

  def reset_password(user, generated_password, locale)
    @user = user
    @generated_password = generated_password

    if locale == "hr"
      mail(to: @user.email, subject: "Account Details", template_path: 'user_mailer', template_name: 'reset_password_hr')
    else
      mail(to: @user.email, subject: "Account Details", template_path: 'user_mailer', template_name: 'user_mailer/reset_password')
    end
  end

  def send_calculated_services(user)
    #TODO slanje mail-a kalkulacije
  end
end
