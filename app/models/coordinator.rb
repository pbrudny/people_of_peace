class Coordinator < ApplicationRecord
  def self.options
    Coordinator.all.map { |c| [c.name, c.id] }
  end
end
