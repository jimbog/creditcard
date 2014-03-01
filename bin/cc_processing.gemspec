Gem::Specification.new do |s|
  s.name        = 'CC processing'
  s.version     = '0.1.0'
  s.summary     = "Basic credit card processing program"
  s.description = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.author      = "Jimmy Garzon"
  s.email       = 'jimmygarzon@gmail.com'
  s.files       = Dir["{bin,lib,spec}/**/*"] +%w(README)
  s.test_files  = Dir["spec/**/*"] +%w(README)
  s.executables = [ 'cc_processing' ]

  s.required_ruby_version = '>=2.1'
  s.add_development_dependency 'rspec'
end
