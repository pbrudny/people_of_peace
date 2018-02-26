module People
  class HelpPerson
    def initialize(person, current_user)
      self.person = person
      self.current_user = current_user
    end

    def call
      if result = person.update_attribute(:coordinator_id, current_user.id)
        notify_users
      end
      result
    end

    private

    attr_accessor :person, :current_user

    def notify_users
      User.where(notify: true).each do |user|
        UserMailer.user_help(user, person).deliver_now
      end
    end
  end
end
