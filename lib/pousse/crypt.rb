require 'openssl'
require 'base64'
require 'openssl/cipher'
require 'openssl/digest'

module Pousse
  module Crypt

    def self.decrypt(data, key, iv)
      aes = OpenSSL::Cipher::Cipher.new('aes-256-cbc')
      aes.decrypt
      aes.reset
      aes.key = Digest::SHA256.digest(key)
      aes.iv = Base64.strict_decode64(iv)

      data = Base64.strict_decode64(data)
      return aes.update(data) + aes.final
    end

    def self.encrypt(data, key, iv = nil)
      aes = OpenSSL::Cipher::Cipher.new('aes-256-cbc')
      iv ||= aes.random_iv
      aes.encrypt
      aes.reset
      aes.key = Digest::SHA256.digest(key)
      aes.iv  = iv

      encrypted_data = aes.update(data) + aes.final
      res = Base64.strict_encode64( encrypted_data )
      return [res, Base64.strict_encode64(iv)]
    end

  end
end
