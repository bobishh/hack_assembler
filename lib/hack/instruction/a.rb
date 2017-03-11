module Hack
  module Instruction
    # a instruction class
    class A
      include Comparable
      attr_reader :value

      def <=>(other)
        value <=> other.value
      end

      def initialize(value)
        @value = value.to_i
      end

      def to_s
        @value.to_s
      end
    end
  end
end
