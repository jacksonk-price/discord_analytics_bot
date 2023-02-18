module ChannelService
  def save_channel(channel)
    Channel.create(name: channel.name, discord_id: channel.id, channel_type: channel.type)
  end

  def save_new_channels
    channels = @server.channels

    discord_channels_count = channels.count
    db_channels_count = Channel.all.count

    if db_channels_count < discord_channels_count
      channels.each do |channel|
        next if Channel.find_by(discord_id: channel.id)

        puts 'New channel found... persisting to database'.yellow
        if save_channel(channel)
          puts "Channel #{channel.name} has been saved to the database".green
        else
          puts "Channel #{channel.name} was unable to be saved to the database".red
        end
      end
    else
      puts 'No new channels found.'.green
    end
  end

  def get_channel_from_event(event)
    discord_id = event.channel.id
    Channel.find_by(discord_id: discord_id)
  end
end