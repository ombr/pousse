#encoding: utf-8
require 'spec_helper'

describe Pousse do


  describe 'Mailer' do

    let :mailer do
      Class.new(Pousse::Mailer) do
        def send_alert
          mail(
            to: 'everybody',
            body: 'alert("Générale !");'
          )
        end
      end 
    end

    let :redis_instance do
      redis_instance = stub()
      Redis.stub(new: redis_instance)
      redis_instance
    end

    it 'provide Pousse::Mailer' do
      expect{
        Class.new Pousse::Mailer
      }.to_not raise_error
    end

    it 'sends the message to redis' do
      redis_instance
        .should_receive(:publish)
        .with('everybody',  'alert("Générale !");')
      mailer.send_alert.deliver
    end
  end

  describe "#js" do

    it 'returns some javascript' do
      require 'v8'
      script = Pousse::js(['test'], 'http://your-poussette-server.com', 'your secret')
      cxt = V8::Context.new
      expect {
        # Javascript syntax should be valid.
        cxt.eval( "test = function(){ #{script} }")
      }.to_not raise_exception
    end

    context 'with global configuration' do

      it 'returns some javascript' do
        Pousse.configure do |config|
          config.secret = 'your secret'
        end
        require 'v8'
        script = Pousse::js(['test'], 'http://your-poussette-server.com')
        cxt = V8::Context.new
        expect {
          # Javascript syntax should be valid.
          cxt.eval( "test = function(){ #{script} }")
        }.to_not raise_exception
      end
    end

    context "without configuration" do
      it 'raise an exception' do
        Pousse.configure do |config|
          config.secret = nil
        end
        expect {
          Pousse::js(['test'], 'http://your-poussette-server.com')
        }.to raise_exception
      end

    end
  end

  describe '#configure' do
    it 'accept redis_configuration' do
      Pousse::configure do |config|
        #config.should be instance_of Pousse::Configuration
        config.redis = {}
      end
    end
  end

end

