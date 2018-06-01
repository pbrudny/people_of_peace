module Users
  class SendReport
    def call
      return if Person.free.count == 0
      User.notifiable.each do |user|
        UserMailer.people_waiting(user).deliver_now
        puts "* Sent to #{user.name}"
      end
    end
  end
end
