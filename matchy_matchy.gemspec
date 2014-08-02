Gem::Specification.new do |s|
  s.name = 'matchy_matchy'
  s.version = '0.0.1'
  s.licenses = ['MIT']
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ['Michael "Gilli" Gilliland']
  s.homepage = 'https://github.com/mjgpy3/matchy_matchy'
  s.date = '2014-08-02'
  s.summary = 'Pattern matching for Ruby!'
  s.description = 'Your wildest dreams have come true! Pattern matching in Ruby!'
  s.files = ['lib/matchy_matchy.rb',
             'spec/lib/matchy_matchy.rb',
             'README.md']
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop'
end
