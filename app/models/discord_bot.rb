class DiscordBot < Discordrb::Bot
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
      Channel.batch_update(event.channels)
      Member.batch_update(event.members)
    end
  end

  def set_voice_state_update_listener
    voice_state_update do |event|
      Member::VoiceSession.update(event.id)
    end
  end
end