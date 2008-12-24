# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{knock-knock}
  s.version = "0.1.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bruno Azisaka Maciel", "Alex Gregianin"]
  s.date = %q{2008-12-24}
  s.description = %q{}
  s.email = ["bruno@dookie.com.br"]
  s.extra_rdoc_files = ["History.txt", "README.rdoc"]
  s.files = ["History.txt", "README.rdoc", "lib/knock_knock.rb", "lib/bubble/knock_knock/connection.rb", "lib/bubble/knock_knock/exceptions.rb", "lib/bubble/knock_knock/hash.rb", "lib/bubble/knock_knock/request.rb", "lib/bubble/knock_knock/services.rb", "test/test_hash.rb", "test/test_helper.rb", "test/test_knock_knock.rb", "test/test_request.rb"]
  s.has_rdoc = true
  s.homepage = %q{KnockKnock was made to turn login with Google Authentication API easier.}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{knock-knock}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{}
  s.test_files = ["test/test_hash.rb", "test/test_helper.rb", "test/test_knock_knock.rb", "test/test_request.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 2.0.2"])
      s.add_development_dependency(%q<newgem>, [">= 1.1.0"])
      s.add_development_dependency(%q<xml-object>, [">= 0.9.8"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<activesupport>, [">= 2.0.2"])
      s.add_dependency(%q<newgem>, [">= 1.1.0"])
      s.add_dependency(%q<xml-object>, [">= 0.9.8"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 2.0.2"])
    s.add_dependency(%q<newgem>, [">= 1.1.0"])
    s.add_dependency(%q<xml-object>, [">= 0.9.8"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
