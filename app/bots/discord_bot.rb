class DiscordBot
  def initialize
    @bot = Discordrb::Bot.new token: Rails.application.credentials.dig(:discord, :token)
    @server =
    add_listeners
  end

  def run
    @bot.run
  end

  private
  def add_listeners
    @bot.ready(&method(:on_ready))
    @bot.voice_state_update(&method(:on_voice_update))
  end

  def on_ready(event)
    puts "Logged in as #{@bot.profile.username} (ID:#{@bot.profile.id}) | #{@bot.servers.size} servers".green
    save_new_members
    save_new_channels
  end

  def on_voice_update(event)
    if voice_join?(event)
      if save_voice_session(event)
        puts "Voice session created and saved".blue
      else
        puts 'Tried to save voice session join, but something went wrong.'.red
      end
    elsif voice_leave?(event)
      if update_voice_session(event)
        puts 'Voice session updated'.blue
      else
        puts 'Tried to update voice session leave, but something went wrong.'.red
      end
    end
  end
end