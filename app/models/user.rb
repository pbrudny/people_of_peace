class User < ApplicationRecord
  has_many :people
  has_many :disciples, class_name: 'Person', foreign_key: :coordinator_id

  geocoded_by :city
  after_validation :geocode

  validates :name, presence: true
  validates :city, presence: true
  validates :email, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :notifiable, -> { where(notify: true) }

  def owner?(person)
    person.user == self || person.coordinator == self
  end

  def self.device_options
    ['komputer', 'telefon']
  end
end
