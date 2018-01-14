class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_person.subject
  #
  def new_person(user, person)
    @user = user
    @person = person

    mail to: user.email, subject: 'Nowy człowiek pokoju'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.people_waiting.subject
  #
  def people_waiting
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
