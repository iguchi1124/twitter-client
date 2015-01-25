# いぐったー(α)


このドキュメントはいぐったー(α)のセットアップ方法を記しています．Railsのインストールについては環境に応じて適宜調べてください．


* Ruby version ruby-2.1.5

* Rails version Rails 4.1.8

* Database
  * development sqlite3
  * production  postgrel


Herokuで動作させることを想定しています．



# セットアップ方法


config/settings.ymlを作成して環境に応じて各値を設定してください．


```ruby
defaults: &defaults

development:
  <<: *defaults
  twitter:
    consumer_key: 
    consumer_secret: 

production:
  <<: *defaults
  twitter:
    consumer_key: 
    consumer_secret: 
```
