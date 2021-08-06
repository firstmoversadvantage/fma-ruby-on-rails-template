class ContactRequestsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    if current_user&.is_admin?
      @contact_requests = ContactRequest.order('id desc').all
    else
      flash[:warning] = t('public.contact_us.flash.only_admins_allowed')
      redirect_to :root
    end
  end

  def new
    @contact_request = ContactRequest.new
    @title = t('public.contact_us.title')
  end

  def create
    @contact_request = ContactRequest.new(contact_us_params)
    if @contact_request.save
      flash[:notice] = t('public.contact_us.flash.contact_request_saved')
      send_email_to_admins_about_new_request
      redirect_to contact_us_path
    else
      render 'new'
    end
    @title = t('public.contact_us.title')
  end

  private

  def contact_us_params
    params.require(:contact_request)
          .permit(
            :name,
            :email_address,
            :telephone,
            :comments
          )
  end

  def send_email_to_admins_about_new_request
    admins = User.where(is_admin: true)
    ContactRequestMailer.new_contact_request_notice(admins).deliver_now
  end
end
