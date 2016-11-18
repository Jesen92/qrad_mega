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
      mail(to: @user.email, subject: "Account Details", template_path: 'user_mailer', template_name: 'reset_password')
    end
  end

  def send_calculated_services(user, locale, params)
    service = Service.find_by(name: params[:service])

    @veeam_user = params[:veeam_user]
    @veeam_user_price = params[:veeam_user].include?("non") ? 40 : 0
    @service = service.name
    @service_price = service.price
    @platform = params[:vm_server]
    @extra_vm = params[:vm_extra]
    @extra_vm_price = @extra_vm.to_i * service.VM_price.to_i
    @extra_storage = params[:storage_extra]
    @extra_storage_price = (params[:storage_extra].to_i/100) * service.storage_price
    @sum_price = @veeam_user_price + @service_price + @extra_vm_price + @extra_storage_price

    mail(to: user.email, subject: "Cloud Connect - Veeam ponuda", template_path: 'user_mailer', template_name: 'calculator')
    #TODO slanje mail-a kalkulacije
  end

  def send_contact_us(locale, name, email, subject, body)

    @name = name
    @email = email
    @subject = subject
    @body = body

    mail(to: @email, subject: @subject, template_path: 'user_mailer', template_name: 'contact_us')
    #TODO slanje mail-a contact_us
  end
end
