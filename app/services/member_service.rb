module MemberService
  def save_new_members
    new_members.each { |new_member| Member.create!(discord_id: new_member.id, display_name: new_member.display_name) }
  end

  def new_members
    @server.members.select { |member| member_ids.exclude?(member.id) }
  end

  def member_ids
    @member_ids ||= Member.pluck(:discord_id)
  end

  def get_member_from_user(user)
    discord_member = @server.member(user)
    Member.find_by(discord_id: discord_member.id)
  end
end