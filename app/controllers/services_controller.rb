class ServicesController < ApplicationController
  #before_filter :authenticate_active_admin_user!

  def index
    @subscriber = Subscriber.new unless user_signed_in?

    expires_in 3.minutes, :public => true
  end

  def show
  end

  def calculator #slanje mail-a za kalkulator - registrirani korisnik
    if params[:users_service][:veeam_user].empty? || params[:users_service][:service].empty? || params[:users_service][:vm_server].empty?
      flash[:calc_alert] = I18n.t("controllers.services.calc_error")
    else
      UserMailer.send_calculated_services(current_user, I18n.locale.to_s, params[:users_service]).deliver_now
      flash[:notice] = I18n.t("controllers.services.calculator")
      return redirect_to root_path
    end

    redirect_to services_index_path(anchor: 'CALCULATOR_SERVICES')
  end

  def contact_us
    UserMailer.send_contact_us(I18n.locale.to_s, params[:email_form][:name], params[:email_form][:email], params[:email_form][:subject], params[:email_form][:body]).deliver_now

    flash[:notice] = I18n.t("controllers.services.contact_us")
    redirect_to :back
  end

  def subscriber_create #slanje mail-a za kalkulator - neregistrirani korisnik
    if params[:subscriber][:veeam_user].empty? || params[:subscriber][:service].empty? || params[:subscriber][:vm_server].empty?
      flash[:calc_alert] = I18n.t("controllers.services.calc_error")
    else
      @subscriber = Subscriber.new(subscriber_params)
      @subscriber.save if Subscriber.find_by(email: @subscriber.email).nil?
      UserMailer.send_calculated_services(@subscriber, I18n.locale.to_s, params[:subscriber]).deliver_now
      flash[:notice] = I18n.t("controllers.services.calculator")
      return redirect_to root_path
    end

    redirect_to services_index_path(anchor: 'CALC')
  end

  def free_trial_request
    if current_user.free_trial_requested
      flash[:alert] = I18n.t("controllers.services.free_trial_error")
    else
      UserMailer.send_free_trial_request(current_user, I18n.locale.to_s).deliver_now
      flash[:notice] = I18n.t("controllers.services.free_trial")
      current_user.free_trial_requested = true
      current_user.save(validate: false)
    end

    redirect_to root_path
  end

  private

    def subscriber_params
      params.require(:subscriber).permit( :email)
    end

end
