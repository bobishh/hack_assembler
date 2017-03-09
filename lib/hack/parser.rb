require 'hack/instruction'

module Hack
  class Parser
    def initialize(filename)
      @filename = filename
    end

    def parsed
      @parsed ||= parse(prepared)
    end

    def prepared
      @prepared ||= prepare(@filename)
    end

    private

    def parse(lines)
      lines.each_with_object({index: 0}) do |line, stack|
        init_instruction(line, stack)
      end
    end

    def init_instruction(line)
    end

    def prepare(filename)
      File.read(filename).split("\r\n").map do |line|
        if line != '' && line.match(/^[(AMD@]/)
          line.gsub(/\s+\/\/.*/, '')
        end
      end.compact
    end
  end
end
