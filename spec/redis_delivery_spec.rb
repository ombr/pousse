#encoding: utf-8
require 'spec_helper'

describe Pousse::RedisDelivery do

  let :redis do
   Pousse::RedisDelivery.new {} 
  end

  describe '#deliver!' do

    let :redis_instance do
      redis_instance = stub()
      Redis.stub(new: redis_instance)
      redis_instance
    end

    let :mail do
      stub(
          to: 'everyone',
          body: 'alert("Générale !");'
        )
    end

    it 'publish to redis' do
      redis_instance
        .should_receive(:publish)
        .with('everyone',  'alert("Générale !");')
      redis.deliver!(mail)
    end

    it 'does not fail when redis can not connect' do
      redis_instance.should_receive :publish do
        raise Redis::CannotConnectError.new 'Error connecting to Redis on 127.0.0.1:6379 (ECONNREFUSED)'
      end
      expect{ redis.deliver!(mail) }.to_not raise_error
    end
  end
end
