#encoding: utf-8
require 'spec_helper'

describe Pousse do
  describe Encrypt do

    describe '#encrypt' do
      it 'encrypt and decrypt a 32 chars string' do
        source = 'Here is some data for the coding'
        key = 'superKey'
        iv = '1234567890123456'
        enc, iv = Encrypt::encrypt(key, iv, source)
        enc.should == "rShSmqpB/ILClbRl82HqFFtoj6zEKU1FSqG0uykYFE2yPsVAquddl8981JEf\nvZwp\n"
      end
    end

  end
end
