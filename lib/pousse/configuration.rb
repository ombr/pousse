module Pousse
  class Configuration
    def initialize
      redis = {}
      server = 'test'
    end
    attr_accessor :redis, :server
  end
end
