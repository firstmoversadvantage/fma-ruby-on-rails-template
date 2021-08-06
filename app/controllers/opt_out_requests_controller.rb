class OptOutRequestsController < ApplicationController
  def index; end

  def new
    @opt_out_request = OptOutRequest.new
  end

  def create
    @opt_out_request = OptOutRequest.new(
      opt_out_request_params.merge(
        meta_data: {
          ip: request.remote_ip,
          referer: request.referrer,
          # user_agent: request.env['HTTP_USER_AGENT'],
          # TODO add more params
        }
      )
    )
    binding.pry
    if @opt_out_request.save
      # TODO display thank you page
    else
      render :new
    end
  end

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
