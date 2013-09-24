# Pousse

[![Pousse](http://doc.agorize.com/pousse/poussette.png)](http://github.com/Studyka/pousse)


[![Build Status](https://travis-ci.org/Studyka/pousse.png?branch=master)](https://travis-ci.org/Studyka/pousse)
[![Dependency Status](https://gemnasium.com/Studyka/pousse.png)](https://gemnasium.com/Studyka/pousse)
[![Code Climate](https://codeclimate.com/github/Studyka/pousse.png)](https://codeclimate.com/github/Studyka/pousse)

Pousse enables you to add realtime to any rails application by sending javascript to users or group of users.

## Installation

Add this line to your application's Gemfile:

    gem 'pousse'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pousse

### Install your Poussette node server on heroku:

```
git clone git@github.com:Studyka/poussette.git
cd poussette
heroku create <your-app>
heroku config:set POUSSE_SECRET=yoursecret # Used as encryption key
heroku addons:add redistogo
git push heroku master
heroku config | grep REDISTOGO_URL # This url is needed in the pousse initializer below
```

## Usage


Create an initializer config/initializer/pousse.rb

Set an envirnoment variable `REDISTOGO_URL` corresponding to the url previously greped

### If you are using Heroku with RedisToGo:
```
Pousse::configure do |config|
  config.server = ENV['POUSSETTE_SERVER'] # Warning: You must specify the port in development mode (eg: http://mypousssette.herokuapp.com:80)
  config.secret = ENV['POUSSE_SECRET']
  if ENV['REDISTOGO_URL'].present?
    uri = URI.parse(ENV['REDISTOGO_URL'])
    config.redis = { host: uri.host, port: uri.port, password: uri.password }
  end
end
```
### else (without Heroku):
```
Pousse::configure do |config|
  config.server = ''
  config.secret = ''
  config.redis = {
    host: '',
    port: '',
    password: ''
  } 
end
```

Add this line to your layout:

```
# Everybody is your channel
<%= javascript_tag Pousse::js([:everybody]) %>
```


Create a new mailer in `app/mailer/pousse_mailer.rb`
```
class PousseMailer < Pousse::Mailer
  def send_alert
    mail(
      to: 'everybody',
      body: 'alert("Hello World !");'
    )
  end
end
```

## Testing:

Add the following line in your `config/environments/test.rb`:
```
Pousse::Mailer.delivery_method = :test
```

## TODO:

- Should add some logging when redis is not available.
- Should add some spec for the configuration.
- Should try again every 30 second or something when the poussette server is offline.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
