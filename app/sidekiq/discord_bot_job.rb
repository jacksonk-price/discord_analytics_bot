class DiscordBotJob
  include Sidekiq::Job

  def self.perform
    bot = DiscordBot.new
    bot.run
  end
end

