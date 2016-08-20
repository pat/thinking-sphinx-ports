require 'spec_helper'

RSpec.describe ThinkingSphinx::Ports::Key do
  let(:rails_context) { double 'Rails', :root => '/foo', :env => 'dev' }
  let(:app)           { double 'Rails app' }

  before :each do
    stub_const 'Rails', rails_context
  end

  describe '.call' do
    it 'returns the Rails app root and env' do
      expect(
        ThinkingSphinx::Ports::Key.call(app)
      ).to eq(['/foo', 'dev'])
    end
  end
end
