class Person < ApplicationRecord
  belongs_to :coordinator, optional: true, class_name: User
  belongs_to :user

  geocoded_by :city
  after_validation :geocode

  validates :name, presence: { message: I18n.t('activerecord.errors.models.person.attributes.name.blank') }
  validates :city, presence: { message: I18n.t('activerecord.errors.models.person.attributes.city.blank') }
  validates :contact, presence: { message: I18n.t('activerecord.errors.models.person.attributes.contact.blank') }

  scope :free, -> { where(coordinator_id: nil) }

  def self.background_options
    ['Zwyczajny', 'New age', 'Metal', 'rozwój osobisty', 'okultyzm i magia', 'uzależnienie', 'nie wiem']
  end

  def self.age_options
    ['dziecko', 'nastolatek', '20+', '30+', '40+', '50+', '60+', '70+', 'nie wiem']
  end

  def self.fellowship_options
    [
      'zwykły katolik',
      'charyzmatyczny katolik',
      'katolik negatywnie nastawiony do katolicyzmu',
      'były Świadek J',
      'członek kościoła protestanckiego',
      'były członek kościoła protestanckiego',
      'poszukujący - odwiedzający kościoły protestanckie',
      'inne',
      'nie wiem'
    ]
  end

  def self.priority_options
    ['normalny', 'pilny', '"przy okazji"']
  end

  def self.source_options
    ['Przez nagrane świadectwo', 'z mapy TLR', 'z polecenia', 'z ulicy', 'znamy się długo', 'inaczej']
  end

  def marker_icon
    "#{marker_color}_Marker#{marker_letter.capitalize}.png"
  end

  def marker_color
    if coordinator
      'blue'
    else
      (created_at < 10.days.ago) ? 'red' : 'green'
    end
  end

  def marker_letter
    if need_baptism
      'C'
    elsif need_bible_study
      'B'
    elsif need_healing || need_deliverance
      'U'
    elsif need_gospel
      'E'
    elsif need_holy_spirit
      'D'
    else
      'S'
    end
  end

  def needs
    %w(need_gospel need_baptism need_healing need_deliverance need_holy_spirit need_bible_study).map do |n|
      I18n.t(n) if send(n)
    end.compact
  end
end
