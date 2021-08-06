class PublicController < ApplicationController
  def index; end

  def cookie_policy
    @title = t('public.cookie_policy.title')
  end

  def faq
    @title = t('public.faq.title')
  end

  def terms_of_use
    @title = t('public.terms_of_use.title')
  end

  def privacy_policy
    @title = t('public.privacy_policy.title')
  end

  def privacy_policy_california
    @title = t('public.privacy_policy.title')
  end

  def not_found
    render :not_found, status: :not_found, layout: 'error_page'
  end
end
