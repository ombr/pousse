require 'base64'
require 'digest'
require 'openssl'

module Pousse
  module Crypt

    def self.decrypt(data, key, iv)
      require 'openssl'
      require 'base64'
      require 'openssl/cipher'
      require 'openssl/digest'
      aes = OpenSSL::Cipher::Cipher.new('aes-256-cbc')
      aes.decrypt
      aes.key = Digest::SHA256.digest(key)
      aes.iv = iv

      res = aes.update(Base64.decode64(data))
    end

    def self.encrypt(data, key, iv = nil)
      require 'openssl'
      require 'base64'
      require 'openssl/cipher'
      require 'openssl/digest'

      iv ||= rand.to_s
      aes = OpenSSL::Cipher::Cipher.new('aes-256-cbc')
      aes.encrypt
      aes.key = Digest::SHA256.digest(key)
      aes.iv  = iv 

      res = Base64.encode64( aes.update(data) << aes.final ).gsub("\n", '')
      return [res, iv]
    end

  end
end
