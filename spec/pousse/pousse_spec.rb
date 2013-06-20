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
    it 'Should return some javascript' do
      puts Pousse::js('test', 'asdasd', 'adasasd')
    end
  end

  describe "#html" do
    it 'Should return some javascript' do
      puts Pousse::html('["test"]', 'http://agorize-notification.herokuapp.com:80', 'adasasd')
    end
  end


  describe '#configure' do
    it 'accept redis_configuration' do
      Pousse::configure do |config|
        config.redis = {}
      end
    end
  end

  describe '#send' do
    it 'render and send a js message' do
      #Pousse::pousse('test', 'mytemplate')
    end
  end

end

