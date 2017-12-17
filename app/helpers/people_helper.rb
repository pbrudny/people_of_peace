module PeopleHelper
  def details(person)
    person_details = ''
    %w(name email phone skype fb source note added_by fellowship need_gospel need_baptism need_healing need_deliverance need_holy_spirit need_bible_study remote_possible background status priority coordinator_id created_at contact)
    person_details.values.join(', ')
  end
end

