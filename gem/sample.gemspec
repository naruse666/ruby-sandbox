# frozen_string_literal: true

require_relative "lib/sample/version"

Gem::Specification.new do |spec|
  spec.name = "sample"
  spec.version = Sample::VERSION
  spec.authors = ["naruse666"]
  spec.email = ["naruse666@users.noreply.github.com"]

  spec.summary = "sample gem"
  spec.description = "sample gem to greet someone"
  spec.homepage = "https://github.com/naruse666/ruby-sandbox"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://github.com/naruse666/ruby-sandbox"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/naruse666/ruby-sandbox"
  spec.metadata["changelog_uri"] = "https://github.com/naruse666/ruby-sandbox/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
