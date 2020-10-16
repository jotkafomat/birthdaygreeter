# coding: utf-8

require 'model/greeter'

describe Greeter do
  describe 'say_hi' do
    it 'says "Hi you!" when no name has been provided', focus: true do
      greeter = Greeter.new
      expect(greeter.say_hi).to eq "Hello there!"
    end
  end
end
