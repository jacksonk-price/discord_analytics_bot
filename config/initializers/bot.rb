require 'discordrb'

ChannelId = 1074904173381951508


bot = Discordrb::Bot.new token: Rails.application.credentials.dig(:discord, :token)

bot.ready do |event|
  puts "Logged in as #{bot.profile.username} (ID:#{bot.profile.id}) | #{bot.servers.size} servers".green
end

bot.message(with_text: 'Ping!') do |event|
  event.respond 'Pong!'
end

bot.run