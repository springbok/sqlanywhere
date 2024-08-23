pkg_version = ""

# The package version of determined by parsing the c source file. This ensures the version is
# only ever specified ins a single place.
File.open(File.join("ext", "sqlanywhere.c") ) do |f|
   f.grep( /const char\* VERSION/ ) do |line|
      pkg_version = /\s*const char\* VERSION\s*=\s*["|']([^"']*)["|'];\s*/.match(line)[1]
   end
end

Gem::Specification.new do |gem|
  gem.authors = ["Eric Farrar"]
  gem.email = 'eric.farrar@ianywhere.com'
  gem.name = 'sqlanywhere'
  gem.summary = 'SQL Anywhere library for Ruby'
  gem.description = <<-EOF
    SQL Anywhere  Driver for Ruby
  EOF
  gem.version = pkg_version
  #gem.autorequire = 'sqlanywhere'
  gem.has_rdoc = true
  gem.rubyforge_project = 'sqlanywhere'
  gem.homepage = 'http://sqlanywhere.rubyforge.org'
  gem.platform = Gem::Platform::CURRENT
  gem.required_ruby_version = '>= 3.2'
  gem.require_paths = ['lib']
  gem.test_file  = 'test/sqlanywhere_test.rb'
  gem.rdoc_options << '--title' << 'SQL Anywhere Ruby Driver' <<
                       '--main' << 'README' <<
                       '--line-numbers'
  gem.extra_rdoc_files = ['README', 'CHANGELOG', 'LICENSE', 'ext/sqlanywhere.c']
end
