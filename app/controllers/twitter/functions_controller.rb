class Twitter::FunctionsController < ApplicationController
  before_action :sign_in_required, except:[:index]

  def timeline
    @tweets = twitter_rest_client.home_timeline
  end

  def mentions_timeline
    @tweets = twitter_rest_client.mentions_timeline
  end

  def tweet
    twitter_rest_client.update params[:tweet]
    flash[:notice] = "ツイートしました。"
    redirect_to :back 
  end

  def friends
    @users = twitter_rest_client.friends
  end

  def followers
    @users = twitter_rest_client.followers
  end

  private
  def twitter_rest_client
    RestClient.configure(
      Settings.twitter.consumer_key, 
      Settings.twitter.consumer_secret, 
      current_user.token, 
      current_user.secret
    )
  end
end