# == Schema Information
#
# Table name: accounts
#
#  id                     :bigint           not null, primary key
#  billing_address        :string(255)
#  billing_city           :string(255)
#  billing_country_code   :string(255)      default("US")
#  billing_state          :string(255)
#  is_active              :boolean          default(FALSE)
#  name                   :string(255)
#  telephone              :string(255)
#  telephone_country_code :string(255)      default("1")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class Account < ApplicationRecord
  validates_presence_of :name,
                        :billing_address,
                        :billing_city,
                        :billing_state
end
