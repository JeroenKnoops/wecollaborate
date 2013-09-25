# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ransack"
  s.version = "0.7.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ernie Miller", "Ryan Bigg"]
  s.date = "2013-09-25"
  s.description = "Ransack is the successor to the MetaSearch gem. It improves and expands upon MetaSearch's functionality, but does not have a 100%-compatible API."
  s.email = ["ernie@erniemiller.org", "radarlistener@gmail.com"]
  s.files = [".gitignore", ".travis.yml", "CONTRIBUTING.md", "Gemfile", "LICENSE", "README.md", "Rakefile", "lib/ransack.rb", "lib/ransack/adapters/active_record.rb", "lib/ransack/adapters/active_record/base.rb", "lib/ransack/adapters/active_record/compat.rb", "lib/ransack/adapters/active_record/context.rb", "lib/ransack/configuration.rb", "lib/ransack/constants.rb", "lib/ransack/context.rb", "lib/ransack/helpers.rb", "lib/ransack/helpers/form_builder.rb", "lib/ransack/helpers/form_helper.rb", "lib/ransack/locale/cs.yml", "lib/ransack/locale/en.yml", "lib/ransack/locale/es.yml", "lib/ransack/locale/fr.yml", "lib/ransack/naming.rb", "lib/ransack/nodes.rb", "lib/ransack/nodes/attribute.rb", "lib/ransack/nodes/bindable.rb", "lib/ransack/nodes/condition.rb", "lib/ransack/nodes/grouping.rb", "lib/ransack/nodes/node.rb", "lib/ransack/nodes/sort.rb", "lib/ransack/nodes/value.rb", "lib/ransack/predicate.rb", "lib/ransack/ransacker.rb", "lib/ransack/search.rb", "lib/ransack/translate.rb", "lib/ransack/version.rb", "lib/ransack/visitor.rb", "ransack.gemspec", "spec/blueprints/articles.rb", "spec/blueprints/comments.rb", "spec/blueprints/notes.rb", "spec/blueprints/people.rb", "spec/blueprints/tags.rb", "spec/console.rb", "spec/helpers/ransack_helper.rb", "spec/ransack/adapters/active_record/base_spec.rb", "spec/ransack/adapters/active_record/context_spec.rb", "spec/ransack/configuration_spec.rb", "spec/ransack/helpers/form_builder_spec.rb", "spec/ransack/helpers/form_helper_spec.rb", "spec/ransack/nodes/condition_spec.rb", "spec/ransack/nodes/grouping_spec.rb", "spec/ransack/predicate_spec.rb", "spec/ransack/search_spec.rb", "spec/spec_helper.rb", "spec/support/en.yml", "spec/support/schema.rb"]
  s.homepage = "https://github.com/ernie/ransack"
  s.require_paths = ["lib"]
  s.rubyforge_project = "ransack"
  s.rubygems_version = "1.8.25"
  s.summary = "Object-based searching for ActiveRecord (currently)."
  s.test_files = ["spec/blueprints/articles.rb", "spec/blueprints/comments.rb", "spec/blueprints/notes.rb", "spec/blueprints/people.rb", "spec/blueprints/tags.rb", "spec/console.rb", "spec/helpers/ransack_helper.rb", "spec/ransack/adapters/active_record/base_spec.rb", "spec/ransack/adapters/active_record/context_spec.rb", "spec/ransack/configuration_spec.rb", "spec/ransack/helpers/form_builder_spec.rb", "spec/ransack/helpers/form_helper_spec.rb", "spec/ransack/nodes/condition_spec.rb", "spec/ransack/nodes/grouping_spec.rb", "spec/ransack/predicate_spec.rb", "spec/ransack/search_spec.rb", "spec/spec_helper.rb", "spec/support/en.yml", "spec/support/schema.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 4.0.0"])
      s.add_runtime_dependency(%q<actionpack>, [">= 4.0.0"])
      s.add_runtime_dependency(%q<polyamorous>, ["~> 0.6.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_development_dependency(%q<machinist>, ["~> 1.0.6"])
      s.add_development_dependency(%q<faker>, ["~> 0.9.5"])
      s.add_development_dependency(%q<sqlite3>, ["~> 1.3.3"])
    else
      s.add_dependency(%q<activerecord>, [">= 4.0.0"])
      s.add_dependency(%q<actionpack>, [">= 4.0.0"])
      s.add_dependency(%q<polyamorous>, ["~> 0.6.0"])
      s.add_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_dependency(%q<machinist>, ["~> 1.0.6"])
      s.add_dependency(%q<faker>, ["~> 0.9.5"])
      s.add_dependency(%q<sqlite3>, ["~> 1.3.3"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 4.0.0"])
    s.add_dependency(%q<actionpack>, [">= 4.0.0"])
    s.add_dependency(%q<polyamorous>, ["~> 0.6.0"])
    s.add_dependency(%q<rspec>, ["~> 2.8.0"])
    s.add_dependency(%q<machinist>, ["~> 1.0.6"])
    s.add_dependency(%q<faker>, ["~> 0.9.5"])
    s.add_dependency(%q<sqlite3>, ["~> 1.3.3"])
  end
end
