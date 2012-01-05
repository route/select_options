$:.push File.expand_path("../lib", __FILE__)
require "select_options/version"

Gem::Specification.new do |s|
  s.name        = "select_options"
  s.version     = SelectOptions::VERSION
  s.date        = "2011-10-04"
  s.authors     = ["Dmitriy Vorotilin"]
  s.email       = "mydeeptown@gmail.com"
  s.homepage    = "https://github.com/route/select_options"
  s.summary     = "select helper with translated options for Rails form_for."
  s.homepage    = "https://github.com/route/select_options"
  s.description = "Provides options for rails form_for select helper. It uses some conventions for your models."

  s.rubyforge_project = "select_options"

  s.files         = Dir["Gemfile", "Gemfile.lock", "README.rdoc", "LICENSE.txt", "Rakefile", "lib/**/*"]
  s.test_files    = Dir["test/**/*"]
  s.require_paths = ["lib"]

  %w{ activemodel activerecord actionpack }.each do |gem|
    s.add_runtime_dependency gem, ">= 3.0.0"
  end

  s.add_development_dependency "mocha"
end
