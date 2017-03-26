class RegistrationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.registration_mailer.registration_confirmation.subject
  #
  def registration_confirmation(record)
    @record = record

    mail to: @record.student.user.email_address, subject: "Registration Update"
  end
end
