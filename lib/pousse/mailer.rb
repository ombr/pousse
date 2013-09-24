module Pousse
  class Mailer < ActionMailer::Base
    self.delivery_method = Pousse::RedisDelivery
    default from: 'pousse@pousse.pousse'
  end
end
