class AdminMailer < ApplicationMailer
  def new_contact_request_notice(admins)
    return nil unless admins.any?
    
    admins.each do |admin|
      mail(to: admin.email, subject: 'New contact request')
    end
  end

  def new_opt_out_request_notice(request_id)
    @opt_out_request = OptOutRequest.find(request_id)
    mail(to: OPT_OUT_REQUESTS_MANAGER, subject: 'New opt-out request')
  end
end
