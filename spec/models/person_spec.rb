require 'rails_helper'

RSpec.describe Person, type: :model do
  describe '#marker_icon' do
    context 'Needs baptism - no coordinator' do
      let(:person) { create(:person, need_baptism: true) }
      it { expect(person.marker_icon).to eq 'green_MarkerC.png' }
    end

    context 'Needs baptism - has coordinator' do
      let(:coordinator) { create(:coordinator) }
      let(:person) { create(:person, need_baptism: true, coordinator: coordinator) }
      it { expect(person.marker_icon).to eq 'blue_MarkerC.png' }
    end

    context 'Needs baptism - no coordinator more than 10 days' do
      let(:coordinator) { create(:coordinator) }
      let!(:person) { create(:person, need_baptism: true) }

      it do
        Timecop.freeze(Date.today + 14) do
          expect(person.marker_icon).to eq 'red_MarkerC.png'
        end
      end
    end
  end
end
