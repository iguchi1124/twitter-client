class Twitter::FunctionsController < ApplicationController
  before_action :sign_in_required, except:[:index]

  def timeline
    @tweets = twitter_client.home_timeline
  end

  def mentions_timeline
    @tweets = twitter_client.mentions_timeline
  end

  def tweet
    twitter_client.update params[:tweet]
    flash[:notice] = "ツイートしました。"
    redirect_to :root
  end

  def follow
    @users = twitter_client.friends
  end

  def followers
    @users = twitter_client.followers
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