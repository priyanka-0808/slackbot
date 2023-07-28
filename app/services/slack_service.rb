require 'slack-ruby-client'

class SlackService
  def initialize
    @api_token = ENV['SLACK_BOT_OAUTH_ACCESS_TOKEN']
    Slack::Web::Client.configure { |config| config.token = @api_token }
    @client = Slack::Web::Client.new
  end

  def send_message(channel, text)
    @client.chat_postMessage(channel: channel, text: text)
  end

	def get_channels_names
    response = @client.conversations_list
		channels = response['channels']
		channels.each do |channel|
			channel_name = channel['name']
			channel_id = channel['id']
			puts "Channel Name: #{channel_name}, Channel ID: #{channel_id}"
		end

    channels_names = response['channels'].map { |channel| channel['name'] }
    channels_names
  end
end