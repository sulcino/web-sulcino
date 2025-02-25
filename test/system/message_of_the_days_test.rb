require "application_system_test_case"

class MessageOfTheDaysTest < ApplicationSystemTestCase
  setup do
    @message_of_the_day = message_of_the_days(:one)
  end

  test "visiting the index" do
    visit message_of_the_days_url
    assert_selector "h1", text: "Message of the days"
  end

  test "should create message of the day" do
    visit message_of_the_days_url
    click_on "New message of the day"

    fill_in "Text cs", with: @message_of_the_day.text_cs
    fill_in "Text en", with: @message_of_the_day.text_en
    fill_in "User", with: @message_of_the_day.user_id
    click_on "Create Message of the day"

    assert_text "Message of the day was successfully created"
    click_on "Back"
  end

  test "should update Message of the day" do
    visit message_of_the_day_url(@message_of_the_day)
    click_on "Edit this message of the day", match: :first

    fill_in "Text cs", with: @message_of_the_day.text_cs
    fill_in "Text en", with: @message_of_the_day.text_en
    fill_in "User", with: @message_of_the_day.user_id
    click_on "Update Message of the day"

    assert_text "Message of the day was successfully updated"
    click_on "Back"
  end

  test "should destroy Message of the day" do
    visit message_of_the_day_url(@message_of_the_day)
    click_on "Destroy this message of the day", match: :first

    assert_text "Message of the day was successfully destroyed"
  end
end
