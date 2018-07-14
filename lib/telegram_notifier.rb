module TelegramNotifier
  def notify(message)
    bot = Telebot::Bot.new(Rails.application.credentials.dig(Rails.env.to_sym,:telegram_token))
    uid = Rails.application.credentials.dig(Rails.env.to_sym,:telegram_user_id)
    bot.send_message(chat_id: uid, text: "#{message}", disable_web_page_preview: true)
  end
end
