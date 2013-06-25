#encoding: utf-8
require 'spec_helper'

describe Pousse::Crypt do


    describe '#encrypt' do


      it 'encrypt a string' do
        source = '["test"]'
        key = 'superKey'
        iv = '1234567890123456'
        res, iv = Pousse::Crypt::encrypt(source, key, iv)
        Pousse::Crypt::decrypt(res, key, iv).should == source
      end

      it 'encrypt a string' do
        source = '["test", "asdasd"]'
        key = 'poussette'
        res, iv = Pousse::Crypt::encrypt(source, key)
        Pousse::Crypt::decrypt(res, key, iv).should == source
      end

      it 'encrypt and decrypt a string' do
        source = 'Here is some data for the coding'
        key = 'superKey'
        enc, iv = Pousse::Crypt::encrypt(source, key)
        res = Pousse::Crypt::decrypt(enc, key, iv)
        res.should == source
      end
    end

end
