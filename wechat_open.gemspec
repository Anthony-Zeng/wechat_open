# frozen_string_literal: true

require_relative "lib/wechat_open/version"

Gem::Specification.new do |spec|
  spec.name = "wechat_open"
  spec.version = WechatOpen::VERSION
  spec.authors = ["anthony"]
  spec.email = ["zengkun@netfarmer.com.cn"]

  spec.summary = spec.description = %q{Ruby API wrapper form wechat open [微信开放平台] }
  spec.homepage = "https://github.com/Anthony-Zeng/wechat_open"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'http', '>= 2.2'
  spec.add_dependency 'activesupport', '>= 6.0'
  spec.add_dependency 'redis'
  spec.add_dependency 'builder', '>= 3.2'

  spec.add_development_dependency 'standard'
  spec.add_development_dependency "bundler", "~> 2.3.26"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.10"

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
