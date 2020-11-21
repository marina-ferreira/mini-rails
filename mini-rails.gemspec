Gem::Specification.new do |spec|
  spec.name          = "mini-rails"
  spec.version       = "0.0.1"
  spec.authors       = ["Marina Ferreira"]
  spec.email         = ["marina.ferreira.developer@gmail.com"]

  spec.summary       = %q{A tiny, mini, version of Rails}
  spec.description   = %q{Framework built during the http://owningrails.com/ class.}
  spec.homepage      = ""
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rack', '~> 2.x'
  spec.add_dependency 'sprockets', '~> 3.0'

  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'sqlite3'

  spec.add_development_dependency 'thin'
  spec.add_development_dependency 'rerun'
  spec.add_development_dependency 'sass'
  spec.add_development_dependency 'coffee-script'
end
