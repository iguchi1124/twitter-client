class Twitter::FunctionsController < ApplicationController
  before_action :sign_in_required, except:[:index]
  helper_method :to_boolean?

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

  def favorite
    unless to_boolean? params[:favorited]
      twitter_rest_client.favorite(params[:id].to_i)
    else
      twitter_rest_client.unfavorite(params[:id].to_i)
    end
  end

  def retweet
    unless to_boolean? params[:retweeted]
      twitter_rest_client.retweet(params[:id].to_i)
    else
      twitter_rest_client.unretweet(params[:id].to_i)
    end
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

  def to_boolean?(str)
    str == 'true'
  end
end