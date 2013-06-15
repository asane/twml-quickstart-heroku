# twml-quickstart-heroku

## About
以下のURLにあるPHPのサンプルをHerokuで動くようにRuby+Sinatra+hamlで書き直したものです

http://jp.twilio.com/docs/quickstart/php/twiml/record-caller-leave-message

## 注意点など
- Ruby1.8.7
- PHPのサンプルではPOSTが使われている部分がすべてGETに変更されています

## つかいかた
- Twilioのアカウントを作成する
- twiml-quickstart-heroku をHerokuにデプロイする
- Twilioのダッシュボード（https://jp.twilio.com/user/account/phone-numbers/incoming）から、音声通話（Voice Request URL）を http://[herokuのアプリケーションURL]/hello-monkey に設定する
- Twilioの電話番号に電話する（＊ +81 50-xxxx-xxxx -> 050-xxxx-xxxx）
- :)

## Herokuへのデプロイ
- 事前に Heroku のアカウントを用意して、Heroku のクライアントツールをインストールしておく必要があります

    $ heroku login
    $ heroku create -s cedar
    $ git remote -v
    $ git push heroku master
    $ heroku scale web=1
    $ heroku open

## ローカル環境で動かす場合

- RubyとRubyGems、Bundlerが使える環境にします

    $ bundle install --path=venrod/bundler
    $ bundle exec ruby web.app
    # ブラウザで http://localhost:4567 にアクセス
