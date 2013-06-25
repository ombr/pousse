module Pousse
  class Configuration
    def initialize
      redis = {}
      server = ''
    end
    attr_accessor :redis, :server
  end
end
