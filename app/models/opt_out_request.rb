class OptOutRequest < ApplicationRecord
  enum request_type: %i[opt_out disclosure deletion]

  validates :name, presence: true, length: { maximum: 40 }
  validates :street_address, presence: true, length: { maximum: 50 }
  validates :city, presence: true, length: { maximum: 50 }
  validates :postal_code, presence: true, length: { minimum: 5, maximum: 10 }
  validates :state, presence: true, length: { is: 2 }

  # For attr_encrypted:
  attr_encrypted_options.merge!(
    key: Rails.application.credentials.attribute_key,
    prefix: '',
    suffix: '_encrypted')
  attr_encrypted :name
  attr_encrypted :street_address
  attr_encrypted :city
  attr_encrypted :postal_code
  attr_encrypted :state

  serialize :meta_data, JSON
end
