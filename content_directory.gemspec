# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "content_directory/version"

Gem::Specification.new do |spec|
  spec.name          = "content_directory"
  spec.version       = ContentDirectory::VERSION
  spec.authors       = ["Steve Randy Tantra"]
  spec.email         = ["steve.randy@gmail.com"]
  spec.description   = "Content Directory is a lightweight replacement of Content Management System. It provides structure for text based content. It comes with a parser, which allows content entries to have metadata and rich formatting."
  spec.summary       = "Lightweight replacement of Content Management System"
  spec.homepage      = "https://github.com/steverandy/content_directory"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "redcarpet", ">= 2.0.0"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "active_support"
end
