class SessionsController < ApplicationController

  def new

  end

  def create

    # debugger
    # return
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])

      session[:user_id] = user.id
      flash[:success] = "Bienvenido #{user.username}"
      redirect_to users_path(user)
    else
      flash.now[:danger] = "Al parecer hay algun inconveniente con sus credenciales."
      render "new"
    end

  end

  def destroy

  end

end