class UsersController < Clearance::UsersController
  skip_before_filter  :verify_authenticity_token

  def newsletter_signup
    user = User.new(email: params[:email], password: PasswordGenerator.generate).save
    redirect_to root_path
  end
end
