#encoding: utf-8
require 'spec_helper'

describe Pousse::RedisDelivery do

  subject do
   Pousse::RedisDelivery.new {}
  end

  describe '#deliver!' do

    let :redis_instance do
      redis_instance = stub(quit: true)
      Redis.stub(new: redis_instance)
      redis_instance
    end

    let :mail do
      stub(
          to: ['everyone'],
          body: stub(decoded: 'alert("Générale !");')
        )
    end

    it 'publish to redis' do
      redis_instance
        .should_receive(:publish)
        .with('everyone',  'alert("Générale !");')
      subject.deliver!(mail)
    end

    it 'does not fail when redis can not connect' do
      redis_instance.should_receive :publish do
        raise Redis::CannotConnectError.new 'Error connecting to Redis on 127.0.0.1:6379 (ECONNREFUSED)'
      end
      expect{ subject.deliver!(mail) }.to_not raise_error
    end

    it 'disconnect after sending' do
      redis_instance.should_receive(:quit)
      subject.deliver!(mail)
    end

    it 'does not crash if Redis.new raise an error' do
      Redis.should_receive(:new) do
        raise Redis::CannotConnectError.new 'Error connecting to Redis on 127.0.0.1:6379 (ECONNREFUSED)'
      end
      subject.deliver!(mail)
    end
  end
end
