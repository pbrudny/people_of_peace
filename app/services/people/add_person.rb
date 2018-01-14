module People
  class AddPerson
    def initialize(person)
      self.person = person
    end

    def call
      if (result = person.save)
        notify_users
      end
      result
    end

    private

    attr_accessor :person

    def notify_users
      User.all.each do |user|
        UserMailer.deliver_new_person(user, person)
      end
    end
  end
end