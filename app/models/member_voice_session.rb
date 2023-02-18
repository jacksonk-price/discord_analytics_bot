class MemberVoiceSession < ApplicationRecord
  belongs_to :member
  belongs_to :channel
end
