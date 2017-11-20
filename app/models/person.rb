class Person < ApplicationRecord
  belongs_to :coordinator, optional: true

  def self.background_options
    ['Zwyczajny', 'New age', 'Metal', 'rozwój osobisty', 'okultyzm i magia', 'uzależnienie', 'nie wiem']
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
end
