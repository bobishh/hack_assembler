$:.unshift File.dirname(__FILE__)
require 'hack/assembler'

module Hack
  class << self
    def process!(asm_file, output = nil)
      Assembler.new(asm_file, output).process
    end
  end
end
