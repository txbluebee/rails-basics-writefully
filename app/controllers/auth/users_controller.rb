class Auth::UsersController < Auth::BaseController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_parmas)
    if @user.save
      Auth::UserMailer.register_email(@user).deliver_now
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def user_parmas
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
