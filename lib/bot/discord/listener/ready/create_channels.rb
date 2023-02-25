module Bot
  class Discord
    module Listener
      class Ready
        class CreateChannels
          attr_accessor :channels

          def initialize(new_channels)
            @channels = channels
          end

          def perform
            new_channels.each do |new_channel|
              Channel.create **arguments_for(new_channel)
            end
          end

          private

          def channel_ids
            @channel_ids ||= Channel.pluck(:discord_id)
          end

          def new_channels
            channels.select { |channel| channel_ids.exclude?(channel.id) }
          end

          def arguments_for(new_channel)
            {
              name: new_channel.name,
              discord_id: new_channel.id,
              channel_type: new_channel.type
            }
          end
        end
      end
    end
  end
end