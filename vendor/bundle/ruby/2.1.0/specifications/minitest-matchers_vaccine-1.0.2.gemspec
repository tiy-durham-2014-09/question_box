# -*- encoding: utf-8 -*-
# stub: minitest-matchers_vaccine 1.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "minitest-matchers_vaccine"
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Ryan McGeary"]
  s.date = "2014-08-03"
  s.description = "Adds matcher support to minitest without all the other RSpec-style expectation \"infections.\""
  s.email = ["ryan@mcgeary.org"]
  s.homepage = "https://github.com/rmm5t/minitest-matchers_vaccine"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9")
  s.rubygems_version = "2.2.2"
  s.summary = "Adds support for RSpec-style matchers to minitest."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<minitest>, ["~> 5.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.6"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<minitest>, ["~> 5.0"])
      s.add_dependency(%q<bundler>, ["~> 1.6"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<minitest>, ["~> 5.0"])
    s.add_dependency(%q<bundler>, ["~> 1.6"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
