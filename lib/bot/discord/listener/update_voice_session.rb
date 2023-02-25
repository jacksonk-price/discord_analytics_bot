module Bot
  class Discord
    module Listener
      class UpdateVoiceSession
        attr_acessor :event

        def initialize(event)
          @event = event
        end

        def perform
          member_voice_session.update(time_left: Time.current)
        end

        private

        def member_voice_session
          Member::VoiceSession.find_or_initialize_by(discord_session_id:)
        end

        def discord_session_id
          event.session_id
        end
      end
    end
  end
end