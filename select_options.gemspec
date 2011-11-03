Gem::Specification.new do |s|
  s.name = %q(select_options)
  s.version = "0.1.0"
  s.date = %q(2011-10-04)
  s.authors = ["Dmitriy Vorotilin"]
  s.email = %q(mydeeptown@gmail.com)
  s.summary = %q(select helper with options for rails form_for.)
  s.homepage = %q(https://github.com/route/select_options)
  s.description = %q(Provides options for rails form_for select helper. It uses some conventions for your models.)
  s.files = ["Gemfile", "Gemfile.lock", "README.rdoc", "LICENSE.txt", "Rakefile", "lib/select_options.rb",
    "lib/select_options/select_options.rb", "lib/select_options/active_record/base.rb", "lib/select_options/active_model/translation.rb"]
  s.add_runtime_dependency 'activemodel', '>= 3.0.0'
  s.add_runtime_dependency 'activerecord', '>= 3.0.0'
  s.add_runtime_dependency 'actionpack', '>= 3.0.0'
end
