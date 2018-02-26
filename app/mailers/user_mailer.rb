class UserMailer < ApplicationMailer

  def new_person(user, person)
    @user = user
    @person = person

    mail to: user.email, subject: I18n.t('user_mailer.new_person.subject')
  end

  def new_user(user, new_user)
    @user = user

    mail to: user.email, subject: I18n.t('user_mailer.new_user.subject')
  end

  def user_help(user, person)
    @user = user
    @person = person
    @people_free = Person.free
    mail to: user.email, subject: I18n.t('user_mailer.user_help.subject')
  end

  def people_waiting(user)
    @people_free = Person.free
    mail to: user.email, subject: I18n.t('user_mailer.user_help.people_waiting')
  end
end
