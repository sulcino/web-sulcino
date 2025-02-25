require "test_helper"

class MessageOfTheDaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_of_the_day = message_of_the_days(:one)
  end

  test "should get index" do
    get message_of_the_days_url
    assert_response :success
  end

  test "should get new" do
    get new_message_of_the_day_url
    assert_response :success
  end

  test "should create message_of_the_day" do
    assert_difference("MessageOfTheDay.count") do
      post message_of_the_days_url, params: { message_of_the_day: { text_cs: @message_of_the_day.text_cs, text_en: @message_of_the_day.text_en, user_id: @message_of_the_day.user_id } }
    end

    assert_redirected_to message_of_the_day_url(MessageOfTheDay.last)
  end

  test "should show message_of_the_day" do
    get message_of_the_day_url(@message_of_the_day)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_of_the_day_url(@message_of_the_day)
    assert_response :success
  end

  test "should update message_of_the_day" do
    patch message_of_the_day_url(@message_of_the_day), params: { message_of_the_day: { text_cs: @message_of_the_day.text_cs, text_en: @message_of_the_day.text_en, user_id: @message_of_the_day.user_id } }
    assert_redirected_to message_of_the_day_url(@message_of_the_day)
  end

  test "should destroy message_of_the_day" do
    assert_difference("MessageOfTheDay.count", -1) do
      delete message_of_the_day_url(@message_of_the_day)
    end

    assert_redirected_to message_of_the_days_url
  end
end
