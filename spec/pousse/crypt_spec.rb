#encoding: utf-8
require 'spec_helper'

describe Pousse::Crypt do


    describe '#encrypt' do


      it 'encrypt a string' do
        source = '["test"]'
        key = 'superKey'
        iv = '1234567890123456'
        res, iv = Pousse::Crypt::encrypt(source, key, iv)
        puts res
        puts iv
        Pousse::Crypt::decrypt(res, key, iv).should == source
      end

      it 'encrypt a string' do
        source = '["test", "asdasd"]'
        key = 'poussette'
        res, iv = Pousse::Crypt::encrypt(source, key)
        puts "key='#{key}'"
        puts "data='#{res}'"
        puts "iv='#{iv}'"
        Pousse::Crypt::decrypt(res, key, iv).should == source
      end

      #it 'encrypt a string with a specific iv' do
        #source = 'Here is some data for the coding'
        #key = 'superKey'
        #iv = '1234567890123456'
        #res, iv_res = Pousse::Crypt::encrypt(source, key, iv)
        #res.should == "rShSmqpB/ILClbRl82HqFFtoj6zEKU1FSqG0uykYFE2yPsVAquddl8981JEfvZwp"
        #iv_res.should == iv
      #end

      it 'encrypt and decrypt a string' do
        source = 'Here is some data for the coding'
        key = 'superKey'
        enc, iv = Pousse::Crypt::encrypt(source, key)
        res = Pousse::Crypt::decrypt(enc, key, iv)
        res.should == source
      end
    end
    describe '#decrypt' do
      #it 'decrypt a json encoded string' do
        #res, iv = Pousse::Crypt::decrypt("Q7gDrRRvnt1k5drOjwrHxg==", 'poussette', "MC42NzYwODAwMzQ1ODc4NTU5")
        #res.should == '["test"]'
      #end

      #it 'decrypt a json encoded string' do
        #res, iv = Pousse::Crypt::decrypt("l1sUe1nFaPO6rKU/nx9o0Q==", 'your secret', "MC45OTQ0Nzg3NzIyMTY2MTQ0")
        #res.should == '["test"]'
      #end

      #it 'decrypt a json encoded string' do
        #res, iv = Pousse::Crypt::decrypt("Los0o6hMJQIuLxCjqAqPgw==", 'poussette', "MC4zNTQ5NzQyNzU2MDE0NTMx")
        #res.should == '["test"]'
      #end

    end

end
