class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by(id: params[:id])


    # if nil user, render error messages and redirects to user index page

    if @user 
      render :show
    else
      flash[:errors] = ['User does not exist']
      redirect_to users_url
    end

  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    # debugger?
    if @user.save
      render :show
    else
      flash[:errors] = @user.errors.full_messages #["password should be at least 4 characterssss"]
      render :new
    end
    # debugger

  end



  def user_params

    params.require(:user).permit(:username, :password)

  end

  # def auth_token
  #   debugger
  #   "<input type='hidden' name='authenticity_token' value='#{form_authenticity_token}'>".html_safe

  # end 
  


end