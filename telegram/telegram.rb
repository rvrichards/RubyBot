require 'telegram_bot'
require 'yaml'

# def replyornot(message)


bot = TelegramBot.new(token: ENV['TELEGRAM_TOKEN'])
bot.get_updates() do |message|
	puts message.to_yaml
	message.reply do |reply|
	command = message.get_command_for(bot)
	# reply.text = "Command is #{command}"
		if command.casecmp?("Hello") 
			reply.text = "Hello, #{message.from.first_name}, good to see you!"
			reply.send_with(bot)
		elsif command.casecmp?("Greet") 
			reply.text = "Greeting from Telegram, #{message.from.first_name}!"
			reply.send_with(bot)
		elsif rand < 0.5	
			# text = message.from.text.get 
			reply.text="Try again, never heard of: #{message.text}. "
			reply.send_with(bot)
		else
			reply.text="Okay #{message.from.first_name}, not sure what #{message.text} means. "
			reply.send_with(bot)
		end
	end	
end