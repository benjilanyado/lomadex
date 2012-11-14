class AccountsController < ApplicationController
  def edit
  	@user = current_user
  end

  def update
  	@user = current_user

  	logger.info @user
  	logger.info @user.valid?
  	logger.info @user.errors.full_messages

  	if @user.update_attributes(params[:user])
  		flash[:alert] = "Account updated!"
  	end

  	render "edit"
  end
end
