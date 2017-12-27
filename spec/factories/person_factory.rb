FactoryBot.define do
  factory :person do
    name 'Tomek Gruszka'
    city 'Kęty'
    source nil
    note 'Bardzo otwarty'
    fellowship 'katolik negatywnie nastawiony do katolicyzmu'
    need_gospel false
    need_baptism true
    need_healing false
    need_deliverance false
    need_holy_spirit true
    need_bible_study true
    remote_possible false
    background 'Zwyczajny'
    longitude 19.2228003
    latitude 49.8807299
  end
end
