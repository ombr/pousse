require 'redis'
require 'action_mailer'
require "pousse/version"
require 'pousse/configuration'
require 'pousse/redis_delivery'
require 'pousse/mailer'

module Pousse
  class << self

    attr_accessor :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end
  end
end
