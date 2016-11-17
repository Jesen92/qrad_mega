class ServicesController < ApplicationController
  #before_filter :authenticate_active_admin_user!

  def index
  end

  def show
  end

  def calculator
    redirect_to :back
    #TODO poziv funkcije za slanje kalkulacije
  end

  def contact_us
    UserMailer.send_contact_us(I18n.locale.to_s, params[:email_form][:name], params[:email_form][:email], params[:email_form][:subject], params[:email_form][:body]).deliver_now

    flash[:notice] = I18n.t("controllers.services.contact_us")
    redirect_to :back
    #TODO poziv funkcije za slanje mail-a upita
  end
end
