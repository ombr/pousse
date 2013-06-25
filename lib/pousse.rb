require 'redis'
require 'action_mailer'
require "pousse/version"
require 'pousse/configuration'
require 'pousse/redis_delivery'
require 'pousse/mailer'

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
      token = channels.to_json
      iv = rand.to_s
      return ERB.new(File.read(TEMPLATE_MIN)).result(binding)
    end

  end
end
