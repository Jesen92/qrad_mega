class UserMailer < ApplicationMailer
  default from: 'Megatrend MDM NO REPLY <mdm@mdmweb.megatrend.com>'

  def generated_password(user, generated_password, locale)
    @user = user
    @generated_password = generated_password

    if locale == "hr"
      mail(to: @user.email, subject: "Korisnički detalji", template_path: 'user_mailer', template_name: 'generated_password_hr')
    else
      mail(to: @user.email, subject: "Account Details", template_path: 'user_mailer', template_name: 'generated_password')
    end
  end

  def user_information(user, locale)
    @user = user

    if locale == "hr"
      mail(to: 'mdm@megatrend.com', subject: "Korisnički detalji", template_path: 'user_mailer', template_name: 'user_information_hr')
    else
      mail(to: 'mdm@megatrend.com', subject: "Korisnički detalji", template_path: 'user_mailer', template_name: 'user_information_hr')
    end
  end

  def no_veeam_user(user,locale)
  end

  def reset_password(user, generated_password, locale)
    @user = user
    @generated_password = generated_password

    if locale == "hr"
      mail(to: @user.email, subject: "Korisnički detalji", template_path: 'user_mailer', template_name: 'reset_password_hr')
    else
      mail(to: @user.email, subject: "Account Details", template_path: 'user_mailer', template_name: 'reset_password')
    end
  end

  def send_calculated_services(user, locale, params)
    #service = Service.find_by(name: params[:service])

    package_price = set_price_for_package(params[:package])
    @user= user.email
    @package_name = params[:package]
    @one_mobile = params[:one_mobile]
    @multiple_mobile = params[:multiple_mobile]
    @price_one_mobile = @one_mobile.to_i * package_price[:one]
    @price_multiple_mobile = @multiple_mobile.to_i * package_price[:multiple]
    #binding.pry
    #@veeam_user = params[:veeam_user]
    #@veeam_user_price = params[:veeam_user].downcase.include?("doesn't") ||  params[:veeam_user].downcase.include?("ne") ? 40 : 0 #TODO ispravi include jer se promijenio prijevod dodaj - include("ne")

    if locale == "hr"
      mail(to: user.email,bcc: 'mdm@megatrend.com', subject: "MDM - Megatrend ponuda", template_path: 'user_mailer', template_name: 'calculator_hr')
      #mail(to: "mdm@megatrend.com", subject: "Cloud Connect - Veeam ponuda", template_path: 'user_mailer', template_name: 'calculator_hr')
    else
      mail(to: user.email,bcc: 'mdm@megatrend.com', subject: "MDM - Megatrend offer", template_path: 'user_mailer', template_name: 'calculator')
    end
  end

  def send_contact_us(locale, name, email, subject, body)

    @name = name
    @email = email
    @subject = subject
    @body = body

    if locale == "hr"
      mail(to: @email,bcc: 'mdm@megatrend.com', subject: @subject, template_path: 'user_mailer', template_name: 'contact_us_hr')
      #mail(to: "mdm@megatrend.com", subject: @subject, template_path: 'user_mailer', template_name: 'contact_us_hr')
    else
      mail(to: @email,bcc: 'mdm@megatrend.com', subject: @subject, template_path: 'user_mailer', template_name: 'contact_us')
    end
  end

  def send_free_trial_request(user, locale)
    #@email = user.email

    #if locale == "hr"
    #  mail(to: @email,bcc: 'mdm@megatrend.com', subject:"Cloud Connect - besplatna proba", template_path: 'user_mailer', template_name: 'free_trial_hr')
      #mail(to: "mdm@megatrend.com", subject:"Cloud Connect - besplatna proba", template_path: 'user_mailer', template_name: 'free_trial_hr')
    #else
    #  mail(to: @email,bcc: 'mdm@megatrend.com', subject:"Cloud Connect - free trial", template_path: 'user_mailer', template_name: 'free_trial')
    #end
  end

  private

  def set_price_for_package(package)
    if package.include? 'Essentials'
      {:one => 2.89, :multiple => 5.79}
    elsif package.include? 'Deluxe'
      {:one => 4.82, :multiple => 9.65}
    elsif package.include? 'Premier'
      {:one => 6.03, :multiple => 12.06}
    elsif package.include? 'Enterprise'
      {:one => 8.68, :multiple => 17.37}
    end
  end

end
