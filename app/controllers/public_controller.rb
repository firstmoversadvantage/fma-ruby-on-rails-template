class PublicController < ApplicationController
  before_action :check_if_saw_cookie_notice

  def index
  end
  
  def disclosure_ccpa
    @title = 'California Consumer Privacy Act Disclosures'
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

  def saw_cookie_notice
    cookies[:saw_cookie_notice] = true
    flash[:info] = nil
    redirect_back(fallback_location: root_path)
  end
end
