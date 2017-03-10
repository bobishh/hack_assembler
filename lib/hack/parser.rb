require 'hack/instruction'

module Hack
  # parser class
  class Parser
    def initialize(filename)
      @filename = filename
    end

    def parsed
      @parsed ||= parse(desymbolized)
    end

    def desymbolized
      @desymbolized ||= process_symbols(prepared)
    end

    def prepared
      @prepared ||= prepare(@filename)
    end

    private

    def process_symbols(lines)
      # TODO: replace symbols with values, fill symbol table
      []
    end

    def parse(lines)
      lines.map do |line|
        Instruction.build(line)
      end
    end

    def prepare(filename)
      File.read(filename).split("\r\n").map do |line|
        if line != '' && line.match(/^[(AMD@]/)
          line.gsub(%r{\s+//.*}, '')
        end
      end.compact
    end
  end
end
