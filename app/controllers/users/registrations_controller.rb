class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @email = params[:email]
    super
  end

  # POST /resource
  def create
    super do |resource|
      subscribe_to_mail_list
    end
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  def unsubscribe
    if user = User.read_access_token(params[:signature])
      user.update_attributes(email_urgent: false, email_weekly: false)
      render html: "You have been unsubscribed from all emails. If you were receiving daily reminders, you can always opt for weekly emails instead by modifying your <a href='http://www.flightcrew.io/accounts/edit'>settings</a>.".html_safe
    else
      render text: "Invalid Link"
    end
  end

  protected

  # You can put the params you want to permit in the empty array.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << User.permissible_params
  end

  # You can put the params you want to permit in the empty array.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) << User.permissible_params
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end

  def subscribe_to_mail_list
    EmailService.new({
      email_weekly: sign_up_params[:email_weekly],
      email_urgent: sign_up_params[:email_urgent],
      email: sign_up_params[:email],
      full_name: sign_up_params[:full_name]
    }).subscribe
  end
end
