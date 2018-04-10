# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = "thinking-sphinx-ports"
  spec.version       = '0.1.1'
  spec.authors       = ["Pat Allan"]
  spec.email         = ["pat@freelancing-gods.com"]

  spec.summary       = %q{Assign unique ports to Thinking Sphinx automatically.}
  spec.homepage      = "http://github.com/pat/thinking-sphinx-ports"

  spec.files         = `git ls-files -z`.split("\x0").reject { |file|
    file.match(%r{^(test|spec|features)/})
  }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'thinking-sphinx', ['>= 3.0', '< 5.0']
  spec.add_runtime_dependency 'railties'

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake",    "~> 10.0"
  spec.add_development_dependency "rspec",   "~> 3.0"
end
