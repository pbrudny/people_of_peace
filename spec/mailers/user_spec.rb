require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "new_person" do
    let(:mail) { UserMailer.new_person }

    it "renders the headers" do
      expect(mail.subject).to eq("New person")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "people_waiting" do
    let(:mail) { UserMailer.people_waiting }

    it "renders the headers" do
      expect(mail.subject).to eq("People waiting")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
