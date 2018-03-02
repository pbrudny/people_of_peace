module Users
  class SendReport
    def call
      User.notifiable.each do |user|
        UserMailer.people_waiting(user).deliver_now
        puts "* Sent to #{user.name}"
      end
    end
  end
end
