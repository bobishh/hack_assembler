module Hack
  module Instruction
    # c instruction class
    class C
      attr_reader :dest, :cmp, :jmp

      def initialize(dest:, cmp:, jmp:)
        @dest = dest
        @cmp = cmp
        @jmp = jmp
      end

      def to_s
        "dest=#{@dest}, cmp=#{@cmp}, @jmp=#{@jmp}"
      end
    end
  end
end
