class Coordinator < ApplicationRecord

  geocoded_by :address
  after_validation :geocode

  validates :name, presence: true
  validates :address, presence: true

  def self.options
    Coordinator.all.map { |c| [c.name, c.id] }
  end
end
