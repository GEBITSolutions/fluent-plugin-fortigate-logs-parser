lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-fortigate-logs-parser"
  spec.version       = "1.0.1"
  spec.authors       = ["Rene Lehmann"]
  spec.email         = ["contact@gebit.de"]
  spec.summary       = %q{Parser for Fortigate logs.}
  spec.homepage      = "https://github.com/GEBITSolutions/fluent-plugin-fortigate-logs-parser"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "test-unit"
  spec.add_dependency "fluentd", ">= 1.15.0", "< 2"

end
