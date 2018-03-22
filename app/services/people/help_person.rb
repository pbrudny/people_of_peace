module People
  class HelpPerson
    def initialize(person, current_user)
      self.person = person
      self.current_user = current_user
    end

    def call
      if result = person.update_attribute(:coordinator_id, current_user.id)
        notify_coordinator
        notify_users
      end
      result
    end

    private

    attr_accessor :person, :current_user

    def notify_coordinator
      UserMailer.user_help_info(current_user, person).deliver_now
    end

    def notify_users
      User.notifiable.except_him(current_user).each do |user|
        UserMailer.user_help(user, person).deliver_now
      end
    end
  end
end
