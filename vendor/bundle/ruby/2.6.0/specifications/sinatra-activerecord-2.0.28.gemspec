# -*- encoding: utf-8 -*-
# stub: sinatra-activerecord 2.0.28 ruby lib

Gem::Specification.new do |s|
  s.name = "sinatra-activerecord".freeze
  s.version = "2.0.28"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Blake Mizerany".freeze, "Janko Marohni\u0107".freeze, "Axel Kee".freeze]
  s.date = "2024-11-29"
  s.description = "Extends Sinatra with ActiveRecord helpers.".freeze
  s.email = "axel@rubyyagi.com".freeze
  s.homepage = "http://github.com/sinatra-activerecord/sinatra-activerecord".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.0".freeze)
  s.rubygems_version = "3.0.3.1".freeze
  s.summary = "Extends Sinatra with ActiveRecord helpers.".freeze

  s.installed_by_version = "3.0.3.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sinatra>.freeze, [">= 1.0"])
      s.add_runtime_dependency(%q<activerecord>.freeze, [">= 4.1"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.1"])
      s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_development_dependency(%q<appraisal>.freeze, [">= 0"])
    else
      s.add_dependency(%q<sinatra>.freeze, [">= 1.0"])
      s.add_dependency(%q<activerecord>.freeze, [">= 4.1"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.1"])
      s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_dependency(%q<appraisal>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<sinatra>.freeze, [">= 1.0"])
    s.add_dependency(%q<activerecord>.freeze, [">= 4.1"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.1"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_dependency(%q<appraisal>.freeze, [">= 0"])
  end
end
