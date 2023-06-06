class UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password_digest: params[:password_digest],
      image_url: params[:image_url]
    )
    @user.save!
    render :show
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(
    name: params[:name] || @user.name,
    email: params[:email] || @user.email,
    password_digest: params[:password_digest] || @user.password_digest,
    image_url: params[:image_url] || @user.image_url
    )
    render :show    
  end
  

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy!
    render json: {message: "User has been delete!"}
  end
end
