module MemberVoiceSessionService
  def save_voice_session(event)
    db_member = get_member_from_user(event.user)
    db_channel = get_channel_from_event(event)
    MemberVoiceSession.create(member_id: db_member.id, channel_id: db_channel.id, discord_session_id: event.session_id, time_joined: DateTime.now)
  end

  def update_voice_session(event)
    voice_session = MemberVoiceSession.find_by(discord_session_id: event.session_id)
    return unless voice_session
    
    voice_session.update(time_left: DateTime.now)
  end

  def voice_join?(event)
    event.old_channel.nil? && event.channel.present?
  end

  def voice_leave?(event)
    event.old_channel.present? && event.channel.nil?
  end
end