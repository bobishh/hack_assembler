require 'hack/coder'
require 'hack/parser'

module Hack
  class Assembler
    attr_reader :source_filename, :output_filename

    def initialize(asm_file, output = nil)
      @source_filename = asm_file
      @output_filename ||= output || init_outfile(asm_file)
    end

    def process
      parsed = Parser.new(@source_filename).parsed
      Coder.new(parsed).write(@output_filename)
    end

    def init_outfile(asm_file)
      asm_file.sub(/\.asm$/, '.hack')
    end
  end
end
