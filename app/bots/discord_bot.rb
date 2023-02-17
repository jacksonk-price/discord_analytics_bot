class DiscordBot
  require 'discordrb'
  Dir["/services/*.rb"].each {|file| require_relative file }
  include ChannelService
  include MemberService
  def initialize
    @bot = Discordrb::Bot.new token: Rails.application.credentials.dig(:discord, :token)
    @server = @bot.server(669719500504956958)
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
    if event.old_channel.nil? && !event.channel.nil?
      # user joins channel
      puts "User #{event.user.name} joined voice channel #{event.channel.name} at #{DateTime.now}"
    elsif !event.old_channel.nil? && event.channel.nil?
      # user leaves channel
      puts "User #{event.user.name} left voice channel #{event.old_channel.name} at #{DateTime.now}"
    end
  end
end