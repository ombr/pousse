require 'redis'
require 'action_mailer'
require "pousse/version"
require 'pousse/configuration'
require 'pousse/redis_delivery'
require 'pousse/mailer'
require 'pousse/crypt'

module Pousse
  TEMPLATE_SOURCE = File.join(
    File.dirname(__FILE__), '..', 'app', 'assets', 'javascript', 'pousse.js.coffee.erb'
  )

  TEMPLATE_MIN = File.join(
    File.dirname(__FILE__), '..', 'app', 'assets', 'javascript', 'pousse.min.js.erb'
  )
  class << self

    attr_accessor :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end

    def js(channels, server, secret = nil)
      require 'erb'
      require 'json'
      secret ||= configuration.secret
      raise 'You should configure your secret or specify it.' if secret == nil
      token, iv = Pousse::Crypt.encrypt(channels.to_json, secret)
      return ERB.new(File.read(TEMPLATE_MIN)).result(binding)
    end

  end
end
