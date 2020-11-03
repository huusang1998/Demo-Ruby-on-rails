class SessionController < ApplicationController
  protect_from_forgery :except => [:login]
  def index
  end

  def login
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      respond_to do |format|
        format.html { redirect_to(tasks_path) }
      end
    else
      flash[:danger] = "Invalid email/password combination"
      render :index
    end
  end

  def show
    render :index
  end
  
end
