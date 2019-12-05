require 'test_helper'

class ContactRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'contact request has name, email and telephone encrypted' do
    contact_request = ContactRequest.create(
                                      name: 'test',
                                      email_address: 'test@fma_template.com',
                                      telephone: '1234567890'
                                    )
    contact_request.reload

    assert_equal contact_request.name, 'test'
    assert_equal contact_request.email_address, 'test@fma_template.com'
    assert_equal contact_request.telephone, '1234567890'
    assert_equal contact_request.name_encrypted, 'TnWuM8xefxK7IBaNmlHkWA=='
    assert_equal contact_request.email_address_encrypted, '3MbJcOwCDW4hbfiidmoBL9FBJZj7TCoibZse+iahh3E='
    assert_equal contact_request.telephone_encrypted, 'oVMW0rQn1eF/PY4BwjVjHA=='
  end
end
