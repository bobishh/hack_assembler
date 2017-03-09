module Hack
  # encodes commands to machine code
  class Coder
    JUMP_TABLE = {
      nil: '000',
      JGT: '001',
      JEQ: '010',
      JGE: '011',
      JLT: '100',
      JNE: '101',
      JLE: '110',
      JMP: '111'
    }.freeze

    DEST_TABLE = {
      null: '000',
      M:    '001',
      D:    '010',
      MD:   '011',
      A:    '100',
      AM:   '101',
      AD:   '110',
      AMD:  '111'
    }

    COMP_TABLE = {
    }.freeze

    def initialize
      @symbol_table = {}
    end
  end
end
