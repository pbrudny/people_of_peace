class UserMailer < ApplicationMailer

  def new_person(user, person)
    @user = user
    @person = person

    mail to: user.email, subject: I18n.t('user_mailer.new_person.subject')
  end

  def user_help(user, person)
    @user = user
    @person = person

    mail to: user.email, subject: I18n.t('user_mailer.user_help.subject')
  end

  def people_waiting
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
