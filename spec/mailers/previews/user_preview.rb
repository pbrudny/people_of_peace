# Preview all emails at http://localhost:3000/rails/mailers/user
class UserPreview < ActionMailer::Preview

  def new_person
    UserMailer.new_person(User.last, Person.last)
  end

  def user_help
    UserMailer.user_help(User.last, Person.last)
  end

  def people_waiting
    UserMailer.people_waiting
  end

end
