require 'yaml'
require 'rails/railtie'
require 'thinking_sphinx'

module ThinkingSphinx::Ports
  PATH = File.expand_path '~/.thinking_sphinx_ports.yml'

  def self.call(key, collection = nil, configuration = nil)
    collection    ||= default_collection
    configuration ||= ThinkingSphinx::Configuration.instance

    port = collection.call key

    configuration.settings['mysql41'] = port
    configuration.searchd.mysql41     = port
  end

  def self.default_collection
    @@default_collection ||= begin
      Collection.new Read.new(PATH), Write.new(PATH)
    end
  end
end

require 'thinking_sphinx/ports/collection'
require 'thinking_sphinx/ports/key'
require 'thinking_sphinx/ports/railtie'
require 'thinking_sphinx/ports/read'
require 'thinking_sphinx/ports/write'
