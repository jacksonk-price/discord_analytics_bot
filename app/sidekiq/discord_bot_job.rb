class DiscordBotJob
  include Sidekiq::Job
  require 'discordrb'

  def self.perform
    bot = Discordrb::Bot.new token: Rails.application.credentials.dig(:discord, :token)
    bot.ready do |event|
      puts "Logged in as #{bot.profile.username} (ID:#{bot.profile.id}) | #{bot.servers.size} servers".green
      puts 'Looking for new members...'.yellow
      find_and_save_new_members(bot)
    end

    bot.voice_state_update do |event|
      if event.old_channel.nil? && !event.channel.nil?
        # A user has joined a voice channel
        puts "User #{event.user.name} joined voice channel #{event.channel.name} at #{DateTime.now}"
        # You can replace the above line with code to insert the data into your database
      elsif !event.old_channel.nil? && event.channel.nil?
        # A user has left a voice channel
        puts "User #{event.user.name} left voice channel #{event.old_channel.name} at #{DateTime.now}"
        # You can replace the above line with code to insert the data into your database
      end
    end

    bot.run
  end

  def self.find_and_save_new_members(bot)
    server = bot.server(669719500504956958)
    members = server.members

    current_members_count = members.count
    saved_members_count = Member.all.count

    if saved_members_count < current_members_count
      members.each do |member|
        next if Member.find_by(discord_id: member.id)
        puts 'New member found... persisting to database.'.yellow
        if Member.create(discord_id: member.id, display_name: member.display_name)
          puts "#{member.display_name} has been saved".green
        else
          puts 'There was an error saving the new member.'.red
        end
      end
    else
      puts 'No new members found.'.green
    end
  end
end

