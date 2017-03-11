module Hack
  # translates commands to machine code
  class Coder
    attr_reader :code

    def initialize(instructions)
      @instructions = instructions
    end

    def code
      @code ||= translate(@instructions)
    end

    def write(outfile)
      file = File.open(outfile, 'w')
      file.write(code)
      file.close
    end

    private

    def translate(instructions)
      instructions.map(&:to_code).join "\r\n"
    end
  end
end
