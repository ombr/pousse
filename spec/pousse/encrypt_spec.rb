#encoding: utf-8
require 'spec_helper'

describe Pousse do
  describe Encrypt do

    describe '#encrypt' do
      it 'encrypt and decrypt a 32 chars string' do
        source = 'Here is some data for the coding'
        enc = Encrypt::encrypt('superkey', 'a2xhcgAAAAAAAAAA', source)
        puts enc
        dec = Encrypt::decrypt('superkey', 'a2xhcgAAAAAAAAAA', enc)
        dec.should == source
      end

      it 'encrypt and decrypt a string' do
        source = '["test"]'
        enc = Encrypt::encrypt('superkey', 'a2xhcgAAAAAAAAAA', source)
        dec = Encrypt::decrypt('superkey', 'a2xhcgAAAAAAAAAA', enc)
        dec.should == source
      end
    end

  end
end
