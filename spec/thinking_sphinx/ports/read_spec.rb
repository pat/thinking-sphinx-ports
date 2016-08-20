require 'spec_helper'

RSpec.describe ThinkingSphinx::Ports::Read do
  let(:subject) { ThinkingSphinx::Ports::Read.new '/foo' }

  before :each do
    allow(File).to receive(:exist?).and_return(true)
    allow(File).to receive(:read).and_return("---\na: b\n")
  end

  describe '.call' do
    it 'returns the YAML parsed contents of the file' do
      expect(File).to receive(:read).with('/foo').and_return("---\na: b\n")

      expect(subject.call).to eq({'a' => 'b'})
    end

    it 'returns an empty array if the file does not exist' do
      allow(File).to receive(:exist?).and_return(false)

      expect(subject.call).to eq({})
    end
  end
end
