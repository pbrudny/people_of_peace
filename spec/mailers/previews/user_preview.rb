# Preview all emails at http://localhost:3000/rails/mailers/user
class UserPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user/new_person
  def new_person
    UserMailer.new_person(User.last, Person.last)
  end

  # Preview this email at http://localhost:3000/rails/mailers/user/people_waiting
  def people_waiting
    UserMailer.people_waiting
  end

end
