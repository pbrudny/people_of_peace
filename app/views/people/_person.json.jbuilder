json.extract! person, :id, :first_name, :last_name, :email, :phone, :skype, :fb, :city, :note, :added_by, :fellowship, :need_gospel, :need_baptism, :need_healing, :need_deliverance, :need_holy_spirit, :need_bible_study, :remote_possible, :background, :status, :coordinator_id, :created_at, :updated_at
json.url person_url(person, format: :json)
