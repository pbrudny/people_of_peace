require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  let(:user) { create :user, email: 'koleszko@gmail.com' }
  let(:helping_user) { create :user, name: 'Dobry Człowiek' }
  let(:person) { create :person, coordinator: helping_user }

  describe 'new_person' do
    let(:mail) { UserMailer.new_person(user, person) }

    it 'renders the headers' do
      expect(mail.subject).to eq 'Nowy człowiek pokoju'
      expect(mail.to).to eq(['koleszko@gmail.com'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Tomek Gruszka')
      expect(mail.body.encoded).to match('Chce chrztu')
    end
  end

  describe 'people_waiting' do
    let(:mail) { UserMailer.people_waiting(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq 'Ludzie pokoju bez opiekunów!'
      expect(mail.to).to eq(['koleszko@gmail.com'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Ciągle nie mamy opiekunów dla')
    end
  end

  describe 'new_user' do
    let(:new_user) { create :user, name: 'Nowy Opiekun' }
    let(:mail) { UserMailer.new_user(user, new_user) }

    it 'renders the headers' do
      expect(mail.subject).to eq 'Mamy nowego opiekuna :)'
      expect(mail.to).to eq(['koleszko@gmail.com'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Właśnie dołączył nowy opiekun ludzi pokoju')
    end
  end

  describe 'user_help' do
    let(:mail) { UserMailer.user_help(user, person) }

    it 'renders the headers' do
      expect(mail.subject).to eq 'Znaleziono pomoc!'
      expect(mail.to).to eq(['koleszko@gmail.com'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match(' zaopiekuje się człowiekiem pokoju')
    end
  end
end
