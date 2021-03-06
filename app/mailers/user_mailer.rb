class UserMailer < ApplicationMailer

  def new_person(user, person)
    @user = user
    @person = person

    mail to: user.email, subject: I18n.t('user_mailer.new_person.subject')
  end

  def new_user(user, new_user)
    @user = new_user

    mail to: user.email, subject: I18n.t('user_mailer.new_user.subject')
  end

  def user_help(user, person)
    @person = person
    @people_free = Person.free
    mail to: user.email, subject: I18n.t('user_mailer.user_help.subject')
  end

  def user_help_info(user, person)
    @user = user
    @person = person
    mail to: user.email, subject: I18n.t('user_mailer.user_help_info.subject')
  end

  def people_waiting(user)
    @people_free = Person.free
    mail to: user.email, subject: I18n.t('user_mailer.user_help.people_waiting')
  end

  def welcome_user(new_user)
    @new_user = new_user
    mail to: new_user.email, subject: I18n.t('user_mailer.welcome_user.subject')
  end
end
