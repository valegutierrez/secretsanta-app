require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:one)
  end

  test "visiting the index" do
    visit events_url
    assert_selector "h1", text: "Events"
  end

  test "creating a Event" do
    visit events_url
    click_on "New Event"

    fill_in "Admin", with: @event.admin_id
    fill_in "Deadline", with: @event.deadline
    fill_in "Description", with: @event.description
    fill_in "Members", with: @event.members
    fill_in "Price end", with: @event.price_end
    fill_in "Price start", with: @event.price_start
    fill_in "Title", with: @event.title
    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "updating a Event" do
    visit events_url
    click_on "Edit", match: :first

    fill_in "Admin", with: @event.admin_id
    fill_in "Deadline", with: @event.deadline
    fill_in "Description", with: @event.description
    fill_in "Members", with: @event.members
    fill_in "Price end", with: @event.price_end
    fill_in "Price start", with: @event.price_start
    fill_in "Title", with: @event.title
    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "destroying a Event" do
    visit events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event was successfully destroyed"
  end
end
