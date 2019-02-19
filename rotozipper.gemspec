
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rotozipper/version"

Gem::Specification.new do |spec|
  spec.name          = "rotozipper"
  spec.version       = Rotozipper::VERSION
  spec.authors       = ["Francesco Ballardin"]
  spec.email         = ["francesco.ballardin@gmail.com"]

  spec.summary       = %q{A tool to help you rotate and zip your ruby app logs.}
  spec.description   = %q{A tool to help you rotate and zip your ruby app logs.}
  spec.homepage      = "https://github.com/Pluvie/ruby-rotozipper"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_dependency "whenever"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
