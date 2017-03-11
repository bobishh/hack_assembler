require 'spec_helper'
require 'hack/instruction'
require 'pry'

describe Hack::Instruction do
  let(:a_line) { '@101' }
  let(:c_line) { 'D=A+M;JMP' }
  let(:c_line1) { 'D=D-M' }

  describe 'A instruction' do
    let(:subject) { described_class.build(a_line) }

    it 'builds A instruction' do
      expect(subject).to be_kind_of Hack::Instruction::A
    end

    it 'fills value of instruction' do
      expect(subject.value).to eq(101)
    end
  end
  describe 'C instruction' do
    let(:subject) { described_class.build(c_line1) }
    it 'builds C instruction' do
      expect(subject).to be_kind_of Hack::Instruction::C
    end

    it 'fills correct fields of instruction' do
      expect(subject.dest).to eq('D')
    end
  end

  describe 'C instruction' do
    let(:subject) { described_class.build(c_line) }
    it 'builds C instruction' do
      expect(subject).to be_kind_of Hack::Instruction::C
    end

    it 'fills correct fields of instruction' do
      expect(subject.dest).to eq('D')
    end
  end
end
