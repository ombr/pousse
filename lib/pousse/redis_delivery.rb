module Pousse

  class RedisDelivery
    def initialize values = {}
      configuration = Pousse::configuration
      @redis_config = configuration.redis
    end

    def deliver!(mail)
      puts "DELIVER ??"
      begin
        redis = Redis.new
        mail.to.each do |to|
          redis.publish(to, mail.body.decoded)
        end
        @redis_config
      rescue Exception => e
        #TODO: Use a real logguer ??
        puts "NOTIFICATION NOT DELIVERED: #{e.message}"
      end
    end
  end

end
