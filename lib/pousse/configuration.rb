module Pousse
  class Configuration
    def initialize
      redis = {}
      server = ''
      secret = nil
    end
    attr_accessor :redis, :server, :secret
  end
end
