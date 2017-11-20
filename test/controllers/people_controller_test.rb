require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get people_url
    assert_response :success
  end

  test "should get new" do
    get new_person_url
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post people_url, params: { person: { added_by: @person.added_by, background: @person.background, city: @person.city, coordinator_id: @person.coordinator_id, email: @person.email, fb: @person.fb, fellowship: @person.fellowship, first_name: @person.first_name, last_name: @person.last_name, need_baptism: @person.need_baptism, need_bible_study: @person.need_bible_study, need_deliverance: @person.need_deliverance, need_gospel: @person.need_gospel, need_healing: @person.need_healing, need_holy_spirit: @person.need_holy_spirit, note: @person.note, phone: @person.phone, remote_possible: @person.remote_possible, skype: @person.skype, status: @person.status } }
    end

    assert_redirected_to person_url(Person.last)
  end

  test "should show person" do
    get person_url(@person)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_url(@person)
    assert_response :success
  end

  test "should update person" do
    patch person_url(@person), params: { person: { added_by: @person.added_by, background: @person.background, city: @person.city, coordinator_id: @person.coordinator_id, email: @person.email, fb: @person.fb, fellowship: @person.fellowship, first_name: @person.first_name, last_name: @person.last_name, need_baptism: @person.need_baptism, need_bible_study: @person.need_bible_study, need_deliverance: @person.need_deliverance, need_gospel: @person.need_gospel, need_healing: @person.need_healing, need_holy_spirit: @person.need_holy_spirit, note: @person.note, phone: @person.phone, remote_possible: @person.remote_possible, skype: @person.skype, status: @person.status } }
    assert_redirected_to person_url(@person)
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete person_url(@person)
    end

    assert_redirected_to people_url
  end
end
