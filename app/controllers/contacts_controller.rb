class ContactsController < ApplicationController
  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      redirect_back(fallback_location: root_path)
    else
      flash.now[:error] = 'Cannot send message'
      redirect_back(fallback_location: root_path)
    end
  end
end
