module MessageOfTheDaysHelper
  def message_of_the_day_text
    message = MessageOfTheDay.order(updated_at: :asc).offset(rand(MessageOfTheDay.count)).first
    return "" if message.blank?

    text_method = "text_#{I18n.locale}"
    message.respond_to?(text_method) ? message.send(text_method) : message.text_en
  end
end
