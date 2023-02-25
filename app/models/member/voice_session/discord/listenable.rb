class Member
  class VoiceSession
    module Discord
      module Listenable
        extend ActiveSupport::Concern

        class_methods do
          def listener(event)
            Listener.new(event).perform
          end
        end
      end
    end
  end
end