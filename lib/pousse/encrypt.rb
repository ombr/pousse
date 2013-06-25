require 'base64'
require 'digest'
require 'openssl'

module Encrypt

  #def self.encrypt(key, iv, data)
    #Base64.encode64(cipher(:encrypt, cryptKey(key), iv, data)).gsub(/\n/, '')
  #end

  #def self.decrypt(key, iv, data)
    #cipher(:decrypt, cryptKey(key), iv, Base64.decode64(data))
  #end

  #private
    #def self.cryptKey(key)
      #Digest::SHA256.digest(key)
    #end
    #def self.cipher(mode, key, iv, data)
      #cipher = OpenSSL::Cipher.new('AES-128-CBC').send(mode)
      #cipher.key = key
      #cipher.iv  = iv

      #encrypted = ''
      #encrypted << cipher.update(data)
      #encrypted << cipher.final
      #encrypted
    #end
  #
  def self.encrypt(key, iv, data)
    require 'openssl'
    require 'base64'
    require 'openssl/cipher'
    require 'openssl/digest'

    aes = OpenSSL::Cipher::Cipher.new('aes-256-cbc')
    aes.encrypt
    aes.key = Digest::SHA256.digest(key)
    aes.iv  = iv

    Base64.encode64( aes.update(data) << aes.final )
  end

end
