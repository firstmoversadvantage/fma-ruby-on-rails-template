class PublicController < ApplicationController
  before_action :check_if_saw_cookie_notice

  def index
  end

  def faq
    @title = t('public.faq.title')
  end

  def disclosure_ccpa
    @title = t('public.ccpa.title')
  end

  def terms_of_use
    @title = t('public.terms_of_use.title')
  end

  def privacy_policy
    @title = t('public.privacy_policy.title')
  end

  def check_if_saw_cookie_notice
    unless cookies[:saw_cookie_notice]
      flash[:info] = t('flash.cookie').html_safe
    end
  end

  def cookie_policy
    @title = t('public.cookie_policy.title')
  end

  def contact_us
    if request.post?
      @contact_request = ContactRequest.new(contact_us_params)
      if @contact_request.save
        flash[:notice] = t('public.contact_us.flash.contact_request_saved')
        send_email_to_admins_about_new_request
      else
        render 'contact_us'
      end
    else
      @contact_request = ContactRequest.new
    end
    @title = t('public.contact_us.title')
  end

  def saw_cookie_notice
    cookies[:saw_cookie_notice] = true
    flash.delete(:info)
    redirect_back(fallback_location: root_path)
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
