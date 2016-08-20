class ThinkingSphinx::Ports::Collection
  FIRST_PORT = 9320

  def initialize(reader, writer)
    @reader, @writer = reader, writer
  end

  def call(key)
    mappings[key] || next_port_for(key)
  end

  private

  attr_reader :reader, :writer

  def mappings
    @mappings ||= reader.call
  end

  def next_port_for(key)
    mappings[key] = next_port
    writer.call mappings
    mappings[key]
  end

  def next_port
    (mappings.values.max || FIRST_PORT) + 1
  end
end
