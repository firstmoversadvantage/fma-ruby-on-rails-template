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
    flash[:info] = "This site uses cookies. See our <a href='/cookie-policy'>Cookie Policy</a> for details.".html_safe unless cookies[:saw_cookie_notice]
  end

  def cookie_policy
    @title = t('public.cookie_policy.title')
  end

  def contact_us
    if request.post?
      @contact_request = ContactRequest.new(contact_us_params)
      if verify_hcaptcha(model: @contact_request) && @contact_request.save!
        send_email_to_admins_about_new_request
        flash[:notice] = 'Your request has been saved. We will contact you ASAP.'
      else
        render 'contact_request'
      end
    else
      @contact_request = ContactRequest.new
    end
    @title = t('public.contact_us.title')
  end

  def saw_cookie_notice
    cookies[:saw_cookie_notice] = true
    flash[:info] = nil
    redirect_back(fallback_location: root_path)
  end

  private
  def contact_us_params
    params.require(:contact_request)
          .permit(
            :name,
            :email_address,
            :telephone
          )
  end

  def send_email_to_admins_about_new_request
    admins = User.where(admin: true)
    ContactRequestMailer.new_contact_request_notice(admins)
  end
end
