class HomeController < ApplicationController
  before_action :login_required, only:[:tweet]

  def index
  end

  def tweet
    twitter_client.update("@null test")
    flash[:notice] = "ツイートしました"
    redirect_to :root
  end

  private
  def twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key = Settings.twitter.consumer_key
      config.consumer_secret = Settings.twitter.consumer_secret
      config.access_token = current_user.token
      config.access_token_secret = current_user.secret
    end
  end
end
