class ThinkingSphinx::Ports::Read
  def initialize(path)
    @path = path
  end

  def call
    return {} unless File.exist?(path)

    YAML.load File.read(path)
  end

  private

  attr_reader :path
end
