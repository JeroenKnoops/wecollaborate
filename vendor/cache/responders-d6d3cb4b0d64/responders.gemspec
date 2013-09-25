# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "responders"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jos\u{e9} Valim"]
  s.date = "2013-09-25"
  s.description = "A set of Rails responders to dry up your application"
  s.email = "contact@plataformatec.com.br"
  s.files = ["CHANGELOG.md", "MIT-LICENSE", "README.md", "lib/generators", "lib/generators/rails", "lib/generators/rails/responders_controller_generator.rb", "lib/generators/rails/templates", "lib/generators/rails/templates/controller.rb", "lib/generators/rails/USAGE", "lib/generators/responders", "lib/generators/responders/install_generator.rb", "lib/responders", "lib/responders/collection_responder.rb", "lib/responders/controller_method.rb", "lib/responders/flash_responder.rb", "lib/responders/http_cache_responder.rb", "lib/responders/locales", "lib/responders/locales/en.yml", "lib/responders/version.rb", "lib/responders.rb", "test/collection_responder_test.rb", "test/controller_method_test.rb", "test/flash_responder_test.rb", "test/http_cache_responder_test.rb", "test/locales", "test/locales/en.yml", "test/test_helper.rb", "test/views", "test/views/addresses", "test/views/addresses/create.js.erb", "test/views/addresses/edit.html.erb", "test/views/addresses/new.html.erb"]
  s.homepage = "http://github.com/plataformatec/responders"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "responders"
  s.rubygems_version = "1.8.25"
  s.summary = "A set of Rails responders to dry up your application"
  s.test_files = ["test/collection_responder_test.rb", "test/controller_method_test.rb", "test/flash_responder_test.rb", "test/http_cache_responder_test.rb", "test/locales", "test/locales/en.yml", "test/test_helper.rb", "test/views", "test/views/addresses", "test/views/addresses/create.js.erb", "test/views/addresses/edit.html.erb", "test/views/addresses/new.html.erb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, ["< 5", ">= 3.2"])
    else
      s.add_dependency(%q<railties>, ["< 5", ">= 3.2"])
    end
  else
    s.add_dependency(%q<railties>, ["< 5", ">= 3.2"])
  end
end
