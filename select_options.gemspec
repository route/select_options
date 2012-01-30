Gem::Specification.new do |s|
  s.name = %q(select_options)
  s.version = "1.1.0"
  s.date = %q(2011-10-04)
  s.authors = ["Dmitriy Vorotilin"]
  s.email = %q(mydeeptown@gmail.com)
  s.summary = %q(select helper with translated options for Rails form_for.)
  s.homepage = %q(https://github.com/route/select_options)
  s.description = %q(Provides options for rails form_for select helper. It uses some conventions for your models.)
  s.files = ["Gemfile", "Gemfile.lock", "README.rdoc", "LICENSE.txt", "Rakefile", "lib/select_options.rb",
    "lib/select_options/select_options.rb", "lib/select_options/active_record/base.rb", "lib/select_options/active_model/translation.rb"]
  
  %w{ activesupport actionpack railties }.each do |gem|
    s.add_dependency gem, ['>= 3.0.0']
  end
  
  s.add_development_dependency "railties", "~> 3.1.0"
  s.add_development_dependency "activerecord", "~> 3.1.0"
  s.add_development_dependency "sqlite3", "~> 1.3.4"
end
