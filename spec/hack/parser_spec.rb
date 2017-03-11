require 'spec_helper'
require 'hack/parser'
require 'hack/instruction'

describe Hack::Parser do
  let(:input_file) { 'input.asm' }
  let(:subject) { described_class.new(input_file) }
  let(:prepared) do
    %w(@2 D=A @3 D=D+A @0 M=D \(END\) @END D;JMP)
  end

  let(:parsed) do
    [
      Hack::Instruction::A.new(2),
      Hack::Instruction::C.new(dest: 'D', cmp: 'A', jmp: ''),
      Hack::Instruction::A.new(3),
      Hack::Instruction::C.new(dest: 'D', cmp: 'D+A', jmp: ''),
      Hack::Instruction::A.new(0),
      Hack::Instruction::C.new(dest: 'M', cmp: 'D', jmp: ''),
      Hack::Instruction::A.new(6),
      Hack::Instruction::C.new(dest: 'D', cmp: '', jmp: 'JMP')
    ].map(&:to_s)
  end

  describe '#prepare' do
    it 'whipes out whitespace' do
      expect(subject.prepared).to eq(prepared)
    end
  end

  describe '#parsed' do
    it 'returns commands array' do
      expect(subject.parsed.map(&:to_s)).to eq(parsed)
    end
  end
end

# symbol table + array of commands
