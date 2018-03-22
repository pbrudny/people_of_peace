module People
  class AddPerson
    def initialize(person)
      self.person = person
    end

    def call
      person.display = true
      if (result = person.save)
        notify_users
      end
      result
    end

    private

    attr_accessor :person

    def notify_users
      User.notifiable.each do |user|
        UserMailer.new_person(user, person).deliver_now
      end
    end
  end
end
