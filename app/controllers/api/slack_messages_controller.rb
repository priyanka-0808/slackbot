class Api::SlackMessagesController < ApplicationController
	skip_before_action :verify_authenticity_token
	def create
    channel = params[:channel]
    text = params[:text]

    slack_service = SlackService.new
    slack_service.send_message(channel, text)

    render json: { message: 'Message sent to Slack channel successfully!' }, status: :ok
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

	def index
    slack_service = SlackService.new
    channels_names = slack_service.get_channels_names
    render json: channels_names
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
end
