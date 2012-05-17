spec = Gem::Specification.new do |s|
  s.name = 'ruby-decompiler'
  s.version = '0.0.3'
  s.summary = 'A decompiler for ruby (both YARV and MRI)'
  s.homepage = 'http://github.com/cout/ruby-decompiler/'
  s.author = 'Paul Brannan'
  s.email = 'curlypaul924@gmail.com'
  s.description = <<-END_DESCRIPTION
Ruby-decompiler is a decompiler for ruby code.  Use it to deconstruct
method signatures and decompile bytecode (1.9.x) or the AST (1.8.x).
  END_DESCRIPTION

  s.add_dependency 'ruby-internal', '>= 0.8.4'

  patterns = [
    'lib/**/*.rb',
    'README.rdoc',
  ]
  s.files = patterns.collect { |p| Dir.glob(p) }.flatten
  s.test_files = Dir.glob('test/test_*.rb')
  s.extra_rdoc_files = 'README.rdoc'
end

