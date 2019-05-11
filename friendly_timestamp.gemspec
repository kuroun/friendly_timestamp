# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'friendly_timestamp/version'

Gem::Specification.new do |spec|
  spec.name          = 'friendly_timestamp'
  spec.version       = FriendlyTimestamp::VERSION
  spec.authors       = ['Kuroun']
  spec.email         = ['kuroun.seung@gmail.com']

  spec.summary       = 'A gem for display time and date based on local time zone in verbal informal saying like more than two day ago, less one week ago...etc.
  It also provides method for full format of date and time in local time zone as well.'
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/kseung-gpsw/friendly_timestamp"
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = 'TODO: Set to 'http://mygemserver.com''
  # else
  #   raise 'RubyGems 2.0 or newer is required to protect against ' \
  #     'public gem pushes.'
  # end

  # spec.files         = 'git ls-files -z'.split("\x0").reject do |f|
  #   f.match(%r{^(test|spec|features)/})
  # end
  spec.files = Dir['{app,lib}/**/*', 'bin/*', 'spec/*', 'Gemfile', 'CODE_OF_CONDUCT.md', 'LICENSE.txt']
  #spec.bindir        = 'exe'
  #spec.executables   = 'rake'
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.5.2'
  spec.required_ruby_version = '~> 2.0'

end
