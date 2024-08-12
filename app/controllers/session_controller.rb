class SessionsController < ApplicationController
  def new
      end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Iniciaste sesión con éxito.'
    else
      flash.now[:alert] = 'Correo electrónico o contraseña inválidos.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Has cerrado sesión.'
  end
end
