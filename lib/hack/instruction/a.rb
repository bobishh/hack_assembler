module Hack
  module Instruction
    # a instruction class
    class A
      attr_reader :value

      def initialize(value)
        @value = value.to_i
      end

      def to_code
        pad_zeros(value.to_s(2))
      end

      alias to_s to_code

      private

      def pad_zeros(string)
        '0' * (16 - string.length) + string
      end
    end
  end
end
