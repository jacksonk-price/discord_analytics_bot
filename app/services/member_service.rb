module MemberService
  def save_server_member(member)
    Member.create(discord_id: member.id, display_name: member.display_name)
  end

  def save_new_members
    members = @server.members

    current_members_count = members.count
    saved_members_count = Member.all.count

    if saved_members_count < current_members_count
      members.each do |member|
        next if Member.find_by(discord_id: member.id)
        puts 'New member found... persisting to database.'.yellow
        if save_server_member(member)
          puts "#{member.display_name} has been saved".green
        else
          puts 'There was an error saving the new member.'.red
        end
      end
    else
      puts 'No new members found.'.green
    end
  end

  def get_member_from_user(user)
    member = @server.member(user)
    Member.find_by(discord_id: member.id)
  end
end