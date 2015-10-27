class ContactMailer < ApplicationMailer

  def share(contact, to)
    I18n.locale = :en
    @contact = contact
    mail(to: to, subject: I18n.t('phonebook.mail.subject'))
  end

end
