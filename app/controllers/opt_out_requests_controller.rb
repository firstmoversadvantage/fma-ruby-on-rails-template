class OptOutRequestsController < ApplicationController
  def index; end

  def new
    @opt_out_request = OptOutRequest.new
  end

  def create
    binding.pry
    @opt_out_request = OptOutRequest.new(opt_out_request_params).merge(
      meta_data: { ip: request.remote_ip }
    )
    binding.pry
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
