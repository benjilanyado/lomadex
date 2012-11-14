class ContactsController < ApplicationController

  before_filter :get_contact, only: [:edit, :update, :destroy]

  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(params[:contact])

  	if @contact.save
  		flash[:alert] = "New contact added!"
  		redirect_to lists_path
  	else
  		render "new"
  	end
  end

  def edit
  end

  def update
    if @contact.update_attributes(params[:contact])
      flash[:alert] = "Updated contact!"
      redirect_to lists_path
    else
      render "edit"
    end
  end

  def destroy
    @contact.destroy
    flash[:alert] = "Deleted contact!"
    redirect_to lists_path
  end

  private

  def get_contact
    @contact = Contact.find(params[:id])

    if current_user != @contact.list.user
      raise "Not your contact, buddy"
    end
  end
end
