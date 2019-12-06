class ContactRequestsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    if current_user.try(:is_admin?)
      @contact_requests = ContactRequest.all
    else
      flash[:warning] = 'Only admins can view this site'
      redirect_to :root
    end
  end
end
