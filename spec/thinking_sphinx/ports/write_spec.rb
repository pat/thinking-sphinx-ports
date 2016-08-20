require 'spec_helper'

RSpec.describe ThinkingSphinx::Ports::Write do
  let(:subject) { ThinkingSphinx::Ports::Write.new '/foo' }

  describe '#call' do
    it 'writes the data as YAML' do
      expect(File).to receive(:write).with('/foo', "---\na: b\n")

      subject.call({'a' => 'b'})
    end
  end
end
