class SessionsController < ApplicationController
  skip_before_action :require_login, only: [ :new, :create ]

  def new
  end

def create
  puts "PARAMS: #{params.inspect}"
  user = User.find_by(email: user_params[:email])

  if user && user.authenticate(user_params[:password])
    log_in(user)
    flash[:notice] = "Connexion réussie !"
    redirect_to root_path
  else
    flash.now[:alert] = "Email ou mot de passe invalide !"
    render :new, status: :unprocessable_entity
  end
end

  def destroy
    log_out
    flash[:notice] = "Déconnexion réussie !"
    redirect_to new_session_path
  end

private

def user_params
  params.require(:session).permit(:email, :password)
end

end
