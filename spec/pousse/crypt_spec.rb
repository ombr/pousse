#encoding: utf-8
require 'spec_helper'

describe Pousse::Crypt do


    describe '#encrypt' do

      it 'encrypt a string with a specific iv' do
        source = 'Here is some data for the coding'
        key = 'superKey'
        iv = '1234567890123456'
        res, iv_res = Pousse::Crypt::encrypt(source, key, iv)
        res.should == "rShSmqpB/ILClbRl82HqFFtoj6zEKU1FSqG0uykYFE2yPsVAquddl8981JEfvZwp"
        iv_res.should == iv
      end

      it 'encrypt and decrypt a string' do
        source = 'Here is some data for the coding'
        key = 'superKey'
        enc, iv = Pousse::Crypt::encrypt(source, key)
        res, iv = Pousse::Crypt::decrypt(enc, key, iv)
        res.should == source
      end
    end

end
