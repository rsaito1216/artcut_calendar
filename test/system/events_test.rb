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

    fill_in "Description", with: @event.description
    fill_in "End date", with: @event.end_date
    fill_in "Start date", with: @event.start_date
    fill_in "Title", with: @event.title
    click_on "Create Event"

    assert_text "予約を取り消しました。カレンダーから消えているか確認してください。"
    click_on "Back"
  end

  test "updating a Event" do
    visit events_url
    click_on "Edit", match: :first

    fill_in "Description", with: @event.description
    fill_in "End date", with: @event.end_date
    fill_in "Start date", with: @event.start_date
    fill_in "Title", with: @event.title
    click_on "Update Event"

    assert_text "予約内容が変更されました。カレンダーに変更が反映されているか確認してください。"
    click_on "Back"
  end

  test "destroying a Event" do
    visit events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "予約が取り消されました。"
  end
end
