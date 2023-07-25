Gem::Specification.new do |s|
  s.name        = "seaweedfs"
  s.description = "A Seaweed-FS Ruby Client"
  s.version     = '0.1.0'
  s.date        = '2023-07-19'
  s.summary     = "seaweedfs"
  s.authors     = ["Drew Lee"]
  s.email       = 'skipmaple@gmail.com'
  s.files       = Dir.glob("lib/**/*") + %w(LICENSE.md README.md)
  s.homepage    = 'https://rubygems.org/gems/seaweedfs'
  s.license     = 'MIT'
  s.required_ruby_version = '>= 2.0.0'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_dependency 'faraday',   '~> 2.7'
  s.add_dependency 'faraday-multipart',   '~> 1.0'
  s.add_dependency 'mimemagic', '~> 0.4.3'
end
