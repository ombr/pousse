module Pousse

  class RedisDelivery
    def initialize values = {}
      configuration = Pousse::configuration
      @redis_config = configuration.redis
    end

    def deliver!(mail)
      redis = nil
      begin
        redis = Redis.new @redis_config
        mail.to.each do |to|
          redis.publish(to, mail.body.decoded)
        end
      rescue Exception => e
        #TODO: Use a real logguer ??
        puts "NOTIFICATION NOT DELIVERED: #{e.message}"
      ensure
        redis.quit unless redis.nil?
      end
    end
  end

end
