module Hack
  module Instruction
    class C
      attr_reader :dest, :cmp, :jmp

      def initialize(dest:, cmp:, jmp:)
        @dest = dest
        @cmp = cmp
        @jmp = jmp
      end

      class << self
        def from_string
        end
      end
    end
  end
end
