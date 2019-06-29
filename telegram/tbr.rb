require 'telegram/bot'
require 'yaml'

token = ENV['TELEGRAM_TOKEN']

puts "Let's roll..."

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
  	# puts message.to_yaml
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello there, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Goodye, #{message.from.first_name}")
	 when '/photo'
	 	bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new('/home/rob/Desktop/MonkeyBeijing.jpg', 'image/jpeg'))
	when '/hello'
	  bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}, good to see you!")
	when '/talk'
		question = 'Talk to me?'
		# See more: https://core.telegram.org/bots/api#replykeyboardmarkup
		answers = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: [%w(Yes No), %w(Maybe So)], one_time_keyboard: true)
		bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers )	  
    end
  end
end