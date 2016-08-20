require 'spec_helper'

RSpec.describe ThinkingSphinx::Ports do
  let(:configuration) { double 'Configuration', :settings => {},
    :searchd => searchd }
  let(:searchd)       { double 'Search Daemon', :mysql41= => true }
  let(:collection)    { double 'Collection', :call => 9333 }

  describe '.call' do
    it 'finds the port from the collection' do
      expect(collection).to receive(:call).with('foo').and_return(9333)

      ThinkingSphinx::Ports.call 'foo', collection, configuration
    end

    it 'modifies the mysql41 option' do
      ThinkingSphinx::Ports.call 'foo', collection, configuration

      expect(configuration.settings['mysql41']).to eq(9333)
    end

    it 'modifies the searchd mysql41 value' do
      expect(searchd).to receive(:mysql41=).with(9333)

      ThinkingSphinx::Ports.call 'foo', collection, configuration
    end
  end
end
