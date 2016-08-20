class ThinkingSphinx::Ports::Key
  def self.call(app)
    [Rails.root.to_s, Rails.env.to_s]
  end
end
