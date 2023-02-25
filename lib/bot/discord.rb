class Bot::Discord < Discordrb::Bot
  attr_accessor :server

  def run(server_id)
    set_server(server_id)
    set_listeners
    super
  end

  private

  def set_server(id)
    @server = server(id)
  end

  def set_listeners
    set_ready_listener
    set_voice_state_update_listener
  end

  def set_ready_listener
    ready do |event|
      Listener::Ready::CreateMembers.new(event.members).perform
      Listener::Ready::CreateChannels.new(event.channels).perform
    end
  end

  def set_voice_state_update_listener
    voice_state_update do |event|
      Listener::VoiceStateUpdate.new(event).perform
    end
  end
end

Bot::Dicsord.new(token: token).run(server_id)