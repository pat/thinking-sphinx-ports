class ThinkingSphinx::Ports::Write
  def initialize(path)
    @path = path
  end

  def call(data)
    File.write path, YAML.dump(data)
  end

  private

  attr_reader :path
end
