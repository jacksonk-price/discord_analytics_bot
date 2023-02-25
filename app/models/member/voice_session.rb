class Member::VoiceSession < ApplicationRecord
  include Discord::Listenable

  belongs_to :member
  belongs_to :channel
end
