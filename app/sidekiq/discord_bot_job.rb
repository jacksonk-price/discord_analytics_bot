class DiscordBotJob
  include Sidekiq::Job
  require 'discordrb'

  def self.perform
    channel_id = 1074904173381951508
    bot = Discordrb::Bot.new token: Rails.application.credentials.dig(:discord, :token)
    bot.ready do |event|
      puts "Logged in as #{bot.profile.username} (ID:#{bot.profile.id}) | #{bot.servers.size} servers".green
      puts 'Looking for new members...'.yellow
      find_and_save_new_members(bot)
    end

    bot.run
  end

  def self.find_and_save_new_members(bot)
    server = bot.server(669719500504956958)
    members = server.members

    members.each do |member|
      next if Member.find_by(discord_id: member.id)
      puts 'New member found... persisting to database.'.yellow
      if Member.create(discord_id: member.id, display_name: member.display_name)
        puts "#{member.display_name} has been saved".green
      else
        puts 'There was an error saving the new member.'.red
      end
    end
  end
end

