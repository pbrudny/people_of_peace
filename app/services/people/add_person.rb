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
      User.where(notify: true).each do |user|
        UserMailer.new_person(user, person).deliver_now
      end
    end
  end
end