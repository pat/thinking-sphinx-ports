require 'spec_helper'

RSpec.describe ThinkingSphinx::Ports::Collection do
  let(:subject) { ThinkingSphinx::Ports::Collection.new reader, writer }
  let(:reader)  { double 'Reader', :call => {'a' => 1} }
  let(:writer)  { double 'Writer', :call => true }

  describe '#call' do
    context 'known keys' do
      it 'returns known values for the known keys' do
        expect(subject.call('a')).to eq(1)
      end
    end

    context 'new keys' do
      let(:writer) { double 'Writer', :call => true }

      it 'generates a new value' do
        expect(subject.call('b')).to eq(2)
      end

      it 'persists values' do
        expect(writer).to receive(:call).with({'a' => 1, 'b' => 2})

        subject.call('b')
      end
    end
  end
end
