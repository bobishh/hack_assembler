require 'hack/instruction/a'
require 'hack/instruction/c'

module Hack
  # module for building instructions
  module Instruction
    A_REGEX = /\@(?<value>[\w\d]+)/
    C_REGEX = /(?<dest>[AMD]*)=?(?<cmp>[^;]*);?(?<jmp>[JMPGELT]*)/

    class << self
      def build(line)
        if line =~ A_REGEX
          parse_a_instruction(line)
        else
          parse_c_instruction(line)
        end
      end

      def parse_a_instruction(line)
        matched = line.match(A_REGEX)
        Instruction::A.new(matched[:value])
      end

      def parse_c_instruction(line)
        matched = line.match(C_REGEX)
        Instruction::C.new(dest: matched[:dest],
                           cmp: matched[:cmp],
                           jmp: matched[:jmp])
      end
    end

    private_class_method :parse_a_instruction
    private_class_method :parse_c_instruction
  end
end
