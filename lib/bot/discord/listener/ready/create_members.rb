module Bot
  class Discord
    module Listener
      class Ready
        class CreateMembers
          attr_accessor :members

          def initialize(members)
            @members = members
          end

          def perform
            new_members.each do |new_member|
              Member.create **arguments_for(new_member)
            end
          end

          private

          def member_ids
            @member_ids ||= Member.pluck(:discord_id)
          end

          def new_members
            members.select { |member| member_ids.exclude?(member.id) }
          end

          def arguments_for(new_member)
            {
              discord_id: new_member.id,
              display_name: member.display_name
            }
          end
        end
      end
    end
  end
end