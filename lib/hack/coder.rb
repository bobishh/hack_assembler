module Hack
  # translates commands to machine code
  class Coder
    def initialize(instructions, symbol_table)
      @instructions = instructions
      @symbol_table = symbol_table
    end

    def code
      @code ||= translate(@instructions)
    end

    private

    def translate(instructions)
      # translate instructions to code
    end
  end
end
