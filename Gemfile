source 'https://rubygems.org'

# Specify your gem's dependencies in youtube-dl.rb.gemspec
gemspec

group :test do
  gem 'activesupport', '< 5.0' unless RUBY_VERSION >= '2.2.2'
end

group :extras do
  gem 'pry-byebug'
end

group :extras, :test do
  gem 'rubocop', '0.34.2'
end
