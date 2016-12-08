class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create]
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

  def create
    resource = nil
    unless User.exists?(email: params[:user][:email])
    resource = User.create_with_password(sign_up_params)
    end
    #resource.save

    #yield resource if block_given?

    if resource.nil?
      flash[:notice] = I18n.t('controllers.registrations.error')
    else
      flash[:notice] = I18n.t('controllers.registrations.notice')
    end

    redirect_to new_user_session_path
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end


  private

  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new sign_up_params
      respond_with_navigational(resource) { render :new }
    end
  end

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :country, :city, :address, :company, :cin, :postal_code)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :phone, :country, :city, :address, :company, :cin, :current_password)
  end
end
