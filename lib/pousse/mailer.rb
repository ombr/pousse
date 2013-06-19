module Pousse
  class Mailer < ActionMailer::Base
    default delivery_method: Pousse::RedisDelivery
  end
end
