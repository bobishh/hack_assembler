require 'spec_helper'
require 'hack/assembler'

describe Hack::Assembler do
  let(:subject) { described_class.new('input.asm')}

  describe 'initialization' do
    it 'initializes with default output file name if none given' do
      expect(subject.output_filename).to eq('input.hack')
    end

    describe 'with outfile' do
      let(:subject) { described_class.new('input.asm', 'output.hack')}

      it 'returns predefined filename' do
        expect(subject.output_filename).to eq('output.hack')
      end
    end
  end
end
