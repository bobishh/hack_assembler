module Hack
  module Instruction
    # c instruction class
    class C
      JMP_TABLE = {
        '' => '000',
        'JGT' => '001',
        'JEQ' => '010',
        'JGE' => '011',
        'JLT' => '100',
        'JNE' => '101',
        'JLE' => '110',
        'JMP' => '111'
      }.freeze

      DEST_TABLE = {
        ''  =>    '000',
        'M' =>    '001',
        'D' =>    '010',
        'A' =>    '100',
        'MD' =>   '011',
        'AM' =>   '101',
        'AD' =>   '110',
        'AMD' =>  '111'
      }.freeze

      CMP_TABLE = {
        '' => '0101010',
        '0' => '0101010',
        '1' => '0111111',
        '-1' => '0111010',
        'D' => '0001100',
        'A' => '0110000',
        'M' => '1110000',
        '!D' => '0001101',
        '!A' => '0110001',
        '!M' => '1110001',
        'D+1' => '0011111',
        'D-1' => '0001110',
        'A+1' => '0110111',
        'A-1' => '0110010',
        'M+1' => '1110111',
        'M-1' => '1110010',
        'D+A' => '0000010',
        'D+M' => '1000010',
        'D-A' => '0010011',
        'D-M' => '1010011',
        'A-D' => '0000111',
        'M-D' => '1000111',
        'D&A' => '0000000',
        'D&M' => '1000000',
        'D|A' => '0010101',
        'D|M' => '1010101'
      }.freeze

      attr_reader :dest, :cmp, :jmp

      def initialize(dest:, cmp:, jmp:)
        @dest = dest
        @cmp = cmp
        @jmp = jmp
      end

      def translate_dest
        DEST_TABLE[@dest]
      end

      def translate_cmp
        CMP_TABLE[@cmp]
      end

      def translate_jmp
        JMP_TABLE[@jmp]
      end

      def inspect
        "dest: #@dest|cmp: #@cmp|jmp: #@jmp"
      end

      def to_code
        "111#{translate_cmp}#{translate_dest}#{translate_jmp}"
      end

      alias to_s to_code
    end
  end
end
