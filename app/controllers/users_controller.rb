class UsersController < Clearance::UsersController
  skip_before_filter  :verify_authenticity_token

  before_filter :authenticate, only: :emails

  def newsletter_signup
    user = User.new(email: params[:email], password: PasswordGenerator.generate).save
    flash[:notice] = "Thanks for signing up!"
    redirect_to root_path
  end

  def emails
    @emails = User.all.map(&:email)
  end
end
