# coding: utf-8
#lib = File.expand_path('../lib', __FILE__)
#$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
#require 'seafile/api/version'

Gem::Specification.new do |spec|
  spec.name          = "seafile-api"
  spec.version       = '0.0.0.70'
  spec.authors       = ["Kostiantyn Semchenko"]
  spec.email         = ["kostiantyn.semchenko@masterofcode.com"]
  spec.summary       = "Seafile-Api"
  spec.description   = "Seafile-Api gem for ruby"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = ["lib/seafile-api.rb","lib/seafile-api/starred.rb","lib/seafile-api/library.rb","lib/seafile-api/library/del_library.rb","lib/seafile-api/library/get_library.rb","lib/seafile-api/library/post_library.rb","lib/seafile-api/message.rb", "lib/seafile-api/file.rb", "lib/seafile-api/account.rb", "lib/seafile-api/config.rb", "lib/seafile-api/file/file_operations.rb", "lib/seafile-api/file/get_operations.rb", "lib/seafile-api/file/post_operations.rb", "lib/seafile-api/file/dry_methods.rb", "lib/seafile-api/group.rb", "lib/seafile-api/group_member.rb", "lib/seafile-api/group_message.rb", "lib/seafile-api/share.rb", "lib/seafile-api/shared/share.rb", "lib/seafile-api/shared/shared_files.rb", "lib/seafile-api/shared/shared_libraries.rb"]
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
