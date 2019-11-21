class ApplicationController < ActionController::Base
  before_action :set_white_label
  
  # We use the @white_label variable to hold information related to our client
  # for the request in quetion. Rererral links from the client will include a
  # uuid that we will use to set @white_label variable for the session. In the
  # event that there is no uuid, or the client does not exist, we will default
  # to using the values for COMPLIANCE_COMPANY
  def set_white_label
    # TODO Lookup the client based on a uuid parameter. For now, we will use
    # COMPLIANCE_COMPANY as a default.
    @white_label = COMPLIANCE_COMPANY
    @in_house_request = @white_label[:company_name] == COMPLIANCE_COMPANY[:company_name]
  end
end
