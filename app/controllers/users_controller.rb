class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def index
    # on code quelque chose qui permet d'afficher le dashboard de l'utilisateur
  end
  def new
     @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in(@user) 
      flash[:notice] = "Inscription réussie !"
      redirect_to root_path 
    else
      flash.now[:alert] = "Erreur lors de l'inscription."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
