class OptOutRequest < ApplicationRecord
  enum request_type: [:opt_out, :disclosure, :delete_data]

  attr_encrypted_options.merge!(
    key: Rails.application.credentials.attribute_key,
    prefix: '',
    suffix: '_encrypted')
  attr_encrypted :name
  attr_encrypted :street_address
  attr_encrypted :city
  attr_encrypted :postal_code
  attr_encrypted :state

end
