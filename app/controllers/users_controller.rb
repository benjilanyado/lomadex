class UsersController < ApplicationController

	before_filter :find_user, only: [:show, :edit, :update]

  def show
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		session[:user_id] = @user.id

  		flash[:alert] = "You've signed up!"
  		redirect_to root_path
  	else
  		render "new"
  	end
  end

  def edit
  end

  def update
  end

  def facebook_login
    omniauth = request.env['omniauth.auth']
    @user = User.find_by_facebook_uid(omniauth[:uid])

    if @user.present?
      flash[:alert] = "You're logged in!"
    else
      @user = User.new
      @user.email = omniauth[:info][:email]
      @user.username = omniauth[:info][:nickname]
      @user.name = omniauth[:info][:name]
      @user.facebook_uid = omniauth[:uid]
      @user.save
      flash[:alert] = "You've signed up!"
    end

    session[:user_id] = @user.id
    redirect_to root_path

  end

  private

  def find_user
  	@user = User.find(params[:id])
  end
end
