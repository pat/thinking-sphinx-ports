class ThinkingSphinx::Ports::Railtie < Rails::Railtie
  initializer "thinking_sphinx_ports.set_port" do |app|
    ThinkingSphinx::Ports.call ThinkingSphinx::Ports::Key.call(app)
  end
end
