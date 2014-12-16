class RestClient
  def self.configure(consumer_key, consumer_secret, user_token, user_secret)
    Twitter::REST::Client.new do |config|
      config.consumer_key = consumer_key
      config.consumer_secret = consumer_secret
      config.access_token = user_token
      config.access_token_secret = user_secret
    end
  end
end
