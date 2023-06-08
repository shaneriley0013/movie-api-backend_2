class UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def new
    @user = User.new
    render template: "users/new"
  end

  def create
    @user = User.new(
      name: params[:user][:name],
      email: params[:user][:email],
      password: params[:user][:password],
      image_url: params[:user][:image_url]
    )
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/users"
    else
      render :new, status: :unprocessable_entity
    end
  end

  
  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy!
    render json: {message: "User has been delete!"}
    redirect_to "/users"
  end
end
