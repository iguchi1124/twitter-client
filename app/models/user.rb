class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.screen_name = auth['info']['nickname']
      user.name = auth['info']['name']
      user.token = auth['credentials']['token']
      user.secret = auth['credentials']['secret']
    end
  end
  def self.find_and_update_with_omniauth(auth)
    user = User.find_by_provider_and_uid(auth['provider'], auth['uid'])
    if user.present?
      user.update(
        screen_name: auth['info']['nickname'],
        name: auth['info']['name'],
        token: auth['credentials']['token'],
        secret: auth['credentials']['secret']
      )
    end
    return user
  end
end
