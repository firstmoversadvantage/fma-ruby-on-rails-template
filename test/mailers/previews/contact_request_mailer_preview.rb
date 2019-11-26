# Preview all emails at http://localhost:3000/rails/mailers/contact_request_mailer
class ContactRequestMailerPreview < ActionMailer::Preview
  def new_contact_request_notice_preview
    admin = User.where(admin: true) # will work after devise installation
    ContactRequest.sample_email(admin)
  end
end
