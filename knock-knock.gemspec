Gem::Specification.new do |s|
  s.name = %q{knock-knock}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alex Gregianin"]
  s.date = %q{2008-12-02}
  s.description = %q{Google Data Api ClientLogin Auth in Ruby}
  s.email = %q{alexandre@bubble.com.br}
  s.extra_rdoc_files = ["lib/hash.rb", "lib/knock.rb", "README"]
  s.files = ["lib/hash.rb", "lib/knock.rb", "Rakefile", "README", "Manifest", "knock-knock.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/alexgregianin/knock-knock}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Knock-knock", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{knock-knock}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Google Data Api ClientLogin Auth in Ruby}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
    else
    end
  else
  end
end
