class OptOutRequestsController < ApplicationController
  def index; end

  def new
    @opt_out_request = OptOutRequest.new
  end

  def create
    browser = Browser.new(request.env['HTTP_USER_AGENT'])
    @opt_out_request = OptOutRequest.new(
      opt_out_request_params.merge(
        meta_data: {
          ip: request.remote_ip,
          referer: request.referrer,
          device: browser.device.name,
          platform: browser.platform.name,
          bot: browser.bot?,
          bot_reason: browser.bot.why?
        }
      )
    )
    if verify_recaptcha(model: @opt_out_request) && @opt_out_request.save
      AdminMailer.new_opt_out_request_notice(@opt_out_request.id).deliver_now unless browser.bot?
      redirect_to thank_you_opt_out_requests_path
    else
      render :new
    end
  end

  def thank_you; end

  def destroy; end

  private

  def opt_out_request_params
    params.require(:opt_out_request)
          .permit(
            :request_type,
            :name,
            :street_address,
            :city,
            :postal_code,
            :state,
            :meta_data
          )
  end
end
