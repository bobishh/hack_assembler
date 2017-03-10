require 'spec_helper'
require 'hack'

describe Hack do
  it 'has process! method' do
    expect(Hack).to respond_to :process!
  end
end
