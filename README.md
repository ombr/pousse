# Pousse

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'pousse'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pousse

## Usage

Create an initializer config/initializer/pousse.rb

```
Pousse::configure do |config|
end
```

Add this line to your layout :

```
<script><%= Pousse::js([:everybody], [server], [secret]) %></script>
```


Create a new mailer in app/mailer/pousse.rb
```
class AlertMailer < Pousse::Mailer
  def send_alert
    mail(
      to: 'everybody',
      body: 'alert("Hello World !");'
    )
  end
end
```

### Your node server on heroku :

```
git clone ...
heroku ...
```

### TODO :

- Should add some logging when redis is not available.
- Should add some spec for the configuration.
- Should try again every 30 second or something when the poussette server is offline.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
